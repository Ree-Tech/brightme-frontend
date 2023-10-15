part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class FetchUserLoading extends UserState {}

final class FetchUserSuccess extends UserState {}

final class FetchUserEror extends UserState {
  final String text;

  const FetchUserEror(this.text);

  @override
  List<Object> get props => [text];
}
