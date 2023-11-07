part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchListAllProduct extends ProductEvent {}

class FetchListCategoryProduct extends ProductEvent {}

class FetchDetailProduct extends ProductEvent {
  final Product product;

  const FetchDetailProduct(this.product);

  @override
  List<Object> get props => [product];
}
