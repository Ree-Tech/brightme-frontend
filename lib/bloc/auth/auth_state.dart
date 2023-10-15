part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class Unauthenticated extends AuthState {}

final class Authenticated extends AuthState {}

final class LogoutLoading extends AuthState {}

final class LogoutEror extends AuthState {
  final String text;

  const LogoutEror(this.text);

  @override
  List<Object> get props => [text];
}

final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterEror extends AuthState {
  final String text;

  const RegisterEror(this.text);

  @override
  List<Object> get props => [text];
}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginEror extends AuthState {
  final String text;

  const LoginEror(this.text);
  @override
  List<Object> get props => [text];
}

final class ConfirmLoading extends AuthState {}

final class ConfirmSucess extends AuthState {}

final class ConfirmEror extends AuthState {
  final String text;

  const ConfirmEror(this.text);

  @override
  List<Object> get props => [text];
}
