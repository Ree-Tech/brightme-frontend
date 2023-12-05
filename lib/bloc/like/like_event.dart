part of 'like_bloc.dart';

sealed class LikeEvent extends Equatable {
  const LikeEvent();

  @override
  List<Object> get props => [];
}

final class AddLikedProductEvent extends LikeEvent {
  final Product product;
  final int id;

  const AddLikedProductEvent(this.product, this.id);

  @override
  List<Object> get props => [product, id];
}

final class DeleteLikeProductByIdEvent extends LikeEvent {
  final int id;
  final Product product;

  const DeleteLikeProductByIdEvent(this.id, this.product);

  @override
  List<Object> get props => [id, product];
}
