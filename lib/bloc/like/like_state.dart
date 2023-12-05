part of 'like_bloc.dart';

sealed class LikeState extends Equatable {
  const LikeState();

  @override
  List<Object> get props => [];
}

final class LikeInitial extends LikeState {}

final class AddLikeProductSuccess extends LikeState {}

final class AddLikeProductEror extends LikeState {
  final String text;

  const AddLikeProductEror(this.text);
  @override
  List<Object> get props => [text];
}

final class DeleteLikeProductByIdLoading extends LikeState {}

final class DeleteLikeProductByIdSuccess extends LikeState {}

final class DeleteLikeProductByIdEror extends LikeState {
  final String text;

  const DeleteLikeProductByIdEror(this.text);

  @override
  List<Object> get props => [text];
}
