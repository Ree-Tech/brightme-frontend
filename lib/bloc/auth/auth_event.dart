part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const RegisterEvent(this.email, this.password, this.name);

  @override
  List<Object> get props => [
        email,
        password,
        name,
      ];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent(this.email, this.password);

  @override
  List<Object> get props => [
        email,
        password,
      ];
}

class ConfirmAccountEvent extends AuthEvent {
  final String email;
  final String code;

  const ConfirmAccountEvent(this.email, this.code);

  @override
  List<Object> get props => [
        email,
        code,
      ];
}

class LogoutEvent extends AuthEvent {}

class HasLoginEvent extends AuthEvent {}

class EmailResetPasswordEvent extends AuthEvent {
  final String email;

  const EmailResetPasswordEvent(this.email);

  @override
  List<Object> get props => [email];
}

class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String code;
  final String password;
  final String confirmPassword;

  const ResetPasswordEvent(
    this.email,
    this.code,
    this.password,
    this.confirmPassword,
  );

  @override
  List<Object> get props => [email, code, password, confirmPassword];
}

class LoginGoogleEvent extends AuthEvent {}
