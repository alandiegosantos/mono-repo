package com.github.alandiegosantos.monorepo.services.review;

import io.grpc.InsecureServerCredentials;
import io.grpc.Server;
import io.grpc.ServerCredentials;
import io.grpc.health.v1.HealthCheckResponse.ServingStatus;
import io.grpc.protobuf.services.ProtoReflectionService;
import io.grpc.services.HealthStatusManager;
import io.grpc.xds.XdsServerBuilder;
import io.grpc.xds.XdsServerCredentials;
import io.grpc.stub.StreamObserver;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

public class GrpcServer {

    private static final Logger logger = Logger.getLogger(GrpcServer.class.getName());

    public static void main(String[] args) throws IOException, InterruptedException {
        int port = 50050;

        ServerCredentials credentials = InsecureServerCredentials.create();

        HealthStatusManager health = new HealthStatusManager();
        final Server server = XdsServerBuilder.forPort(port, credentials)
            .addService(ProtoReflectionService.newInstance())
            .addService(new ReviewServiceImpl())
            .addService(health.getHealthService())
            .build()
            .start();
        System.out.println("Starting server");
        Runtime.getRuntime().addShutdownHook(new Thread() {
            @Override
            public void run() {
                // Start graceful shutdown
                System.out.println("Shutdown server");
                server.shutdown();
                try {
                    // Wait for RPCs to complete processing
                    if (!server.awaitTermination(60, TimeUnit.SECONDS)) {
                        // That was plenty of time. Let's cancel the remaining RPCs
                        server.shutdownNow();
                        // shutdownNow isn't instantaneous, so give a bit of time to clean resources up
                        // gracefully. Normally this will be well under a second.
                        server.awaitTermination(5, TimeUnit.SECONDS);
                    }
                } catch (InterruptedException ex) {
                    server.shutdownNow();
                }
            }
        });

        // This would normally be tied to the service's dependencies. For example, if HostnameGreeter
        // used a Channel to contact a required service, then when 'channel.getState() ==
        // TRANSIENT_FAILURE' we'd want to set NOT_SERVING. But HostnameGreeter has no dependencies, so
        // hard-coding SERVING is appropriate.
        health.setStatus("", ServingStatus.SERVING);
        server.awaitTermination();
    }
}
