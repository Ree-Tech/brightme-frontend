part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class FetchListCartEvent extends CartEvent {}

class AddCartItemEvent extends CartEvent {
  final int id;

  const AddCartItemEvent(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateQuantityItemEvent extends CartEvent {
  final int id;
  final int quantity;

  const UpdateQuantityItemEvent(this.id, this.quantity);

  @override
  List<Object> get props => [
        id,
        quantity,
      ];
}

class UpdateCheckItemEvent extends CartEvent {
  final int id;
  final int check;

  const UpdateCheckItemEvent(this.id, this.check);

  @override
  List<Object> get props => [
        id,
        check,
      ];
}

class DeleteCartItemEvent extends CartEvent {
  final int id;

  const DeleteCartItemEvent(
    this.id,
  );

  @override
  List<Object> get props => [
        id,
      ];
}
