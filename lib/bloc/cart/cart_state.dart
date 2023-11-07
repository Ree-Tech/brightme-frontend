part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class FetchCartLoading extends CartState {}

final class FetchCartSuccess extends CartState {}

final class FetchCartNoData extends CartState {}

final class FetchCartEror extends CartState {
  final String text;

  const FetchCartEror(this.text);

  @override
  List<Object> get props => [text];
}

final class AddCartItemLoading extends CartState {}

final class AddCartItemSuccess extends CartState {}

final class AddCartItemEror extends CartState {
  final String text;

  const AddCartItemEror(this.text);

  @override
  List<Object> get props => [text];
}

final class UpdateQuantityItemLoading extends CartState {}

final class UpdateQuantityItemSuccess extends CartState {}

final class UpdateQuantityItemEror extends CartState {
  final String text;

  const UpdateQuantityItemEror(this.text);

  @override
  List<Object> get props => [text];
}

final class DeleteCartItemLoading extends CartState {}

final class DeleteCartItemSuccess extends CartState {}

final class DeleteCartItemEror extends CartState {
  final String text;

  const DeleteCartItemEror(this.text);

  @override
  List<Object> get props => [text];
}

final class UpdateCheckItemLoading extends CartState {}

final class UpdateCheckItemSuccess extends CartState {}

final class UpdateCheckItemEror extends CartState {
  final String text;

  const UpdateCheckItemEror(this.text);

  @override
  List<Object> get props => [text];
}
