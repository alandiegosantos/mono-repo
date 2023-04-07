package com.github.alandiegosantos.monorepo.services.review;

import com.github.alandiegosantos.monorepo.proto.rating.Rating;
import com.github.alandiegosantos.monorepo.proto.rating.RatingRequest;
import com.github.alandiegosantos.monorepo.proto.rating.RatingServiceGrpc;
import com.github.alandiegosantos.monorepo.proto.review.ReviewServiceGrpc;
import com.github.alandiegosantos.monorepo.proto.review.ReviewRequest;
import com.github.alandiegosantos.monorepo.proto.review.Review;
import com.github.alandiegosantos.monorepo.proto.review.ReviewProductRequest;
import com.github.alandiegosantos.monorepo.proto.review.ReviewProductResponse;
import io.grpc.Grpc;
import io.grpc.InsecureChannelCredentials;
import io.grpc.ManagedChannel;
import io.grpc.Server;
import io.grpc.ServerBuilder;
import io.grpc.stub.StreamObserver;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import java.util.logging.Logger;
import java.util.List;
import java.util.ArrayList;

public class ReviewServiceImpl extends ReviewServiceGrpc.ReviewServiceImplBase {

    private static final Logger logger = Logger.getLogger(ReviewServiceImpl.class.getName());
    private static final String ratingAddress = "rating.services.svc.cluster.local:50050";
    private RatingServiceGrpc.RatingServiceBlockingStub ratingClient;

    public ReviewServiceImpl() {
        ManagedChannel channel = Grpc.newChannelBuilder(ratingAddress, InsecureChannelCredentials.create())
            .build();
        ratingClient = RatingServiceGrpc.newBlockingStub(channel);
    }

    @Override
    public void getReview(ReviewRequest req, StreamObserver<Review> responseObserver) {
        responseObserver.onNext(getReviewFromId(req.getId()));
        responseObserver.onCompleted();
    }

    @Override
    public void getReviewsForProduct(ReviewProductRequest req, StreamObserver<ReviewProductResponse> responseObserver) {

        List<Review> reviews = new ArrayList<Review>();
        ReviewProductResponse.Builder responseBuilder = ReviewProductResponse.newBuilder();
        for(int i = 0;i < 20; i++) {
            responseBuilder.addReviews(getReviewFromId(String.valueOf(i)));
        }
        responseObserver.onNext(responseBuilder.build());
        responseObserver.onCompleted();

    }

    private Review getReviewFromId(String reviewId) {
        Rating rating = ratingClient.getRating(
            RatingRequest.newBuilder().setReviewId(reviewId).build());
        Review review = Review.newBuilder()
            .setId(reviewId)
            .setReview("Awesome")
            .setRating(rating)
            .build();
        return review;
    }
}
