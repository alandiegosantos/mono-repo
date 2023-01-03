package com.github.alandiegosantos.monorepo.services.rating;

import com.github.alandiegosantos.monorepo.proto.rating.RatingServiceGrpc;
import com.github.alandiegosantos.monorepo.proto.rating.RatingProto.RatingRequest;
import com.github.alandiegosantos.monorepo.proto.rating.RatingProto.Rating;
import io.grpc.Server;
import io.grpc.ServerBuilder;
// import io.grpc.xds.XdsServerBuilder;
// import io.grpc.xds.XdsServerCredentials;
import io.grpc.stub.StreamObserver;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;

public class RatingServiceImpl extends RatingServiceGrpc.RatingServiceImplBase {

    private static final Logger logger = Logger.getLogger(RatingServiceImpl.class.getName());

    @Override
    public void getRating(RatingRequest req, StreamObserver<Rating> responseObserver) {
        Rating rating = Rating.newBuilder()
            .setRating(5)
            .build();
        responseObserver.onNext(rating);
        responseObserver.onCompleted();
    }
}
