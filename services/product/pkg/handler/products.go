package handler

import (
	"context"

	"google.golang.org/grpc"

	"github.com/pkg/errors"

	detail "github.com/alandiegosantos/monorepo/proto/detail"
	product "github.com/alandiegosantos/monorepo/proto/product"
	review "github.com/alandiegosantos/monorepo/proto/review"
)

const (
	detailsAddr = "xds:///detail.services.svc.cluster.local:50050"
	reviewsAddr = "xds:///review.services.svc.cluster.local:50050"
)

type productsServer struct {
	product.UnimplementedProductServiceServer
	reviewClient review.ReviewServiceClient
	detailClient detail.DetailServiceClient
}

func (s *productsServer) GetProduct(ctx context.Context, req *product.ProductRequest) (*product.Product, error) {
	d, err := s.detailClient.GetDetail(ctx, &detail.DetailRequest{
		ProductId: "123",
	})
	if err != nil {
		return nil, errors.Wrap(err, "Error calling detail service")
	}
	reviews, err := s.reviewClient.GetReviewsForProduct(ctx, &review.ReviewProductRequest{
		ProductId: "123",
	})
	if err != nil {
		return nil, errors.Wrap(err, "Error calling reviews service")
	}
	p := &product.Product{
		Id:      "123",
		Detail:  d,
		Reviews: reviews.Reviews,
	}
	return p, nil
}

func NewProductsServiceHandler() (product.ProductServiceServer, error) {
	conn, err := grpc.Dial(detailsAddr, grpc.WithInsecure())
	if err != nil {
		return nil, err
	}
	detailClient := detail.NewDetailServiceClient(conn)

	conn, err = grpc.Dial(reviewsAddr, grpc.WithInsecure())
	if err != nil {
		return nil, err
	}
	reviewClient := review.NewReviewServiceClient(conn)

	return &productsServer{
		reviewClient: reviewClient,
		detailClient: detailClient,
	}, nil
}
