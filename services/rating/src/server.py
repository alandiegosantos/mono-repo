import logging

import grpc
import grpc.experimental
import proto.rating.rating_pb2 as rating_pb2
import proto.rating.rating_pb2_grpc as rating_pb2_grpc

from concurrent import futures

_THREAD_POOL_SIZE = 256

class RatingService(rating_pb2_grpc.RatingServiceServicer):

    def __init__(self):
        pass

    def GetRating(
            self, request: rating_pb2.RatingRequest,
            context: grpc.aio.ServicerContext) -> rating_pb2.Rating:

        return rating_pb2.Rating(
            reviewId=request.reviewId,
            rating=4,
        )

def serve() -> None:
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=_THREAD_POOL_SIZE),
        xds=True)
    rating_pb2_grpc.add_RatingServiceServicer_to_server(RatingService(), server)
    listen_addr = '0.0.0.0:50050'
    server.add_insecure_port(listen_addr)
    server.start()
    logging.info("Server listening on port %s", listen_addr)
    server.wait_for_termination()

if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    serve()
