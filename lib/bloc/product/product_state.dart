part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class AllProductLoading extends ProductState {}

final class AllProductSucces extends ProductState {}

final class AllProductNoData extends ProductState {}

final class AllProductEror extends ProductState {
  final String text;

  const AllProductEror(this.text);

  @override
  List<Object> get props => [text];
}

final class ListProductCategoryLoading extends ProductState {}

final class ListProductCategorySucces extends ProductState {}

final class ListProductCategoryNoData extends ProductState {}

final class ListProductCategoryEror extends ProductState {
  final String text;

  const ListProductCategoryEror(this.text);

  @override
  List<Object> get props => [text];
}

final class ProductDetailLoading extends ProductState {}

final class ProductDetailSucces extends ProductState {
  final Product product;

  const ProductDetailSucces(this.product);

  @override
  List<Object> get props => [product];
}

final class ProductDetailEror extends ProductState {
  final String text;

  const ProductDetailEror(this.text);

  @override
  List<Object> get props => [text];
}
