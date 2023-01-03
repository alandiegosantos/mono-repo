import logging

import grpc
import grpc.experimental
import proto.rating.rating_pb2 as rating_pb2
import proto.review.review_pb2 as review_pb2
import proto.rating.rating_pb2_grpc as rating_pb2_grpc
import proto.review.review_pb2_grpc as review_pb2_grpc

from concurrent import futures

_THREAD_POOL_SIZE = 256

class ReviewService(review_pb2_grpc.ReviewServiceServicer):

    def __init__(self):
        pass

    def GetReview(
            self, request: review_pb2.ReviewRequest,
            context: grpc.aio.ServicerContext) -> review_pb2.Review:

        return self._get_review(request.id)

    def GetReviewForProduct(
            self, request: review_pb2.ReviewProductRequest,
            context: grpc.aio.ServicerContext) -> review_pb2.ReviewProductResponse:

        reviews = []
        for i in range(20):
            review = self._get_review(i)
            reviews.append(review)

        return review_pb2.ReviewProductResponse(
            reviews = reviews,
        )

    def _get_review(self, id) -> review_pb2.Review:
        channel = grpc.insecure_channel("rating.services:50050")
        with channel:
            rating_client = rating_pb2_grpc.RatingServiceStub(channel)
            rating = rating_client.GetRating(rating_pb2.RatingRequest(reviewId=str(id)))
            return review_pb2.Review(
                id=str(id),
                review="Good book!!",
                rating=rating,
            )

def serve() -> None:
    server = grpc.server(
        futures.ThreadPoolExecutor(max_workers=_THREAD_POOL_SIZE),
        xds=True)
    review_pb2_grpc.add_ReviewServiceServicer_to_server(ReviewService(), server)
    listen_addr = '0.0.0.0:50050'
    server.add_insecure_port(listen_addr)
    server.start()
    logging.info("Server listening on port %s", listen_addr)
    server.wait_for_termination()

if __name__ == '__main__':
    logging.basicConfig(level=logging.INFO)
    serve()
