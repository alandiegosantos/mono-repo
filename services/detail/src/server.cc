#include <iostream>
#include <memory>

#include <gflags/gflags.h>
#include <grpcpp/ext/proto_server_reflection_plugin.h>
#include <grpcpp/grpcpp.h>
#include <grpcpp/health_check_service_interface.h>
#include <grpc/support/log.h>
#include <grpcpp/grpcpp.h>
#include <grpcpp/xds_server_builder.h>

#include "proto/detail/detail.grpc.pb.h"

DEFINE_int32(port, 50050, "Port to listen for gRPC requests");

using grpc::ChannelArguments;
using grpc::Server;
using grpc::ServerAsyncResponseWriter;
using grpc::XdsServerBuilder;
using grpc::ServerCompletionQueue;
using grpc::ServerContext;
using grpc::Status;
using detail::DetailRequest;
using detail::Detail;
using detail::DetailService;

class ServerImpl final {
  public:
    ~ServerImpl() {
      server_->Shutdown();
      cq_->Shutdown();
    }

  void Run() {

    sleep(5);

    std::string server_address = "0.0.0.0:" + std::to_string(FLAGS_port);

    XdsServerBuilder builder;
    // Listen on the given address without any authentication mechanism.
    builder.AddListeningPort(
      server_address,
      grpc::XdsServerCredentials(grpc::InsecureServerCredentials()));
    // Register "service_" as the instance through which we'll communicate with
    // clients. In this case it corresponds to an *asynchronous* service.
    builder.RegisterService(&service_);
    // Get hold of the completion queue used for the asynchronous communication
    // with the gRPC runtime.
    cq_ = builder.AddCompletionQueue();
    // Finally assemble the server.
    server_ = builder.BuildAndStart();
    std::cout << "Server listening on " << server_address << std::endl;

    // Proceed to the server's main loop.
    HandleRpcs();
  }

  private:
  // Class encompasing the state and logic needed to serve a request.
  class CallData {
    public:
      // Take in the "service" instance (in this case representing an asynchronous
      // server) and the completion queue "cq" used for asynchronous communication
      // with the gRPC runtime.
      CallData(DetailService::AsyncService* service, ServerCompletionQueue* cq)
          : service_(service), cq_(cq), responder_(&ctx_), status_(CREATE) {
        // Invoke the serving logic right away.
        Proceed();
      }

      void Proceed() {
        if (status_ == CREATE) {
          // Make this instance progress to the PROCESS state.
          status_ = PROCESS;

          // As part of the initial CREATE state, we *request* that the system
          // start processing SayHello requests. In this request, "this" acts are
          // the tag uniquely identifying the request (so that different CallData
          // instances can serve different requests concurrently), in this case
          // the memory address of this CallData instance.
          service_->RequestGetDetail(&ctx_, &request_, &responder_, cq_, cq_,
                                    this);
        } else if (status_ == PROCESS) {
          // Spawn a new CallData instance to serve new clients while we process
          // the one for this CallData. The instance will deallocate itself as
          // part of its FINISH state.
          new CallData(service_, cq_);

          // TODO: Implement a dynamic query to allow more books
          reply_.set_productid(request_.productid());
          reply_.set_author("William Shakespeare");
          reply_.set_publisher("PublisherA");
          reply_.set_isbn10("1234567890");
          reply_.set_isbn13("123-1234567890");
          reply_.set_year(1595);
          reply_.set_pages(200);
          reply_.set_language(detail::Language::ENGLISH);
          reply_.set_type(detail::Type::PAPERBACK);

          // And we are done! Let the gRPC runtime know we've finished, using the
          // memory address of this instance as the uniquely identifying tag for
          // the event.
          status_ = FINISH;
          responder_.Finish(reply_, Status::OK, this);
        } else {
          GPR_ASSERT(status_ == FINISH);
          // Once in the FINISH state, deallocate ourselves (CallData).
          delete this;
        }
      }

    private:
      // The means of communication with the gRPC runtime for an asynchronous
      // server.
      DetailService::AsyncService* service_;
      // The producer-consumer queue where for asynchronous server notifications.
      ServerCompletionQueue* cq_;
      // Context for the rpc, allowing to tweak aspects of it such as the use
      // of compression, authentication, as well as to send metadata back to the
      // client.
      ServerContext ctx_;

      // What we get from the client.
      DetailRequest request_;
      // What we send back to the client.
      Detail reply_;

      // The means to get back to the client.
      ServerAsyncResponseWriter<Detail> responder_;

      // Let's implement a tiny state machine with the following states.
      enum CallStatus { CREATE, PROCESS, FINISH };
      CallStatus status_;  // The current serving state.
  };

  // This can be run in multiple threads if needed.
  void HandleRpcs() {
    // Spawn a new CallData instance to serve new clients.
    new CallData(&service_, cq_.get());
    void* tag;  // uniquely identifies a request.
    bool ok;
    while (true) {
      // Block waiting to read the next event from the completion queue. The
      // event is uniquely identified by its tag, which in this case is the
      // memory address of a CallData instance.
      // The return value of Next should always be checked. This return value
      // tells us whether there is any kind of event or cq_ is shutting down.
      GPR_ASSERT(cq_->Next(&tag, &ok));
      GPR_ASSERT(ok);
      static_cast<CallData*>(tag)->Proceed();
    }
  }

  std::unique_ptr<ServerCompletionQueue> cq_;
  DetailService::AsyncService service_;
  std::unique_ptr<Server> server_;
};

int main(int argc, char** argv) {
  gflags::SetUsageMessage("Details gRPC server");
  gflags::SetVersionString("0.0.1-alpha");
  gflags::ParseCommandLineFlags(&argc, &argv, true);

  ChannelArguments args;
  args.SetCompressionAlgorithm(GRPC_COMPRESS_GZIP);

  ServerImpl server;
  server.Run();
  return 0;
}
