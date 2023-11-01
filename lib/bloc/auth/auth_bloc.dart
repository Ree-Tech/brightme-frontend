import 'package:bloc/bloc.dart';
import 'package:bright_me/services/auth_services.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthServices _authServices = AuthServices();
  AuthBloc() : super(AuthInitial()) {
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        var reseponse = await _authServices.registerServices(
          event.email,
          event.password,
          event.name,
        );

        if (reseponse) emit(RegisterSuccess());
      } catch (eror) {
        emit(RegisterEror(eror.toString()));
      }
    });

    on<ConfirmAccountEvent>((event, emit) async {
      emit(ConfirmLoading());
      try {
        var response = await _authServices.verifikasiAccountServices(
            event.email, event.code);

        if (response) emit(ConfirmSucess());
      } catch (eror) {
        emit(ConfirmEror(eror.toString()));
      }
    });

    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        var response =
            await _authServices.loginServices(event.email, event.password);

        if (response != null) {
          response ? emit(LoginSuccess()) : emit(UserSurvey());
        }
      } catch (eror) {
        emit(LoginEror("eror at LoginEvent: ${eror.toString()} "));
      }
    });

    on<HasLoginEvent>((event, emit) async {
      var reseponse = await _authServices.hasLogin();

      reseponse ? emit(Authenticated()) : emit(Unauthenticated());
    });

    on<LogoutEvent>((event, emit) async {
      emit(LogoutLoading());
      try {
        var response = await _authServices.logoutServices();

        response
            ? emit(Unauthenticated())
            : emit(const LogoutEror("fail Logout"));
      } catch (eror) {
        emit(LogoutEror("eror at logoutevent ; ${eror.toString()}"));
      }
    });

    on<EmailResetPasswordEvent>((event, emit) async {
      emit(EmailResetPasswordLoading());

      try {
        var response =
            await _authServices.emailResetPasswordServices(event.email);

        response
            ? emit(EmailResetPasswordSuccess())
            : emit(const EmailResetPasswordEror("Send email fail"));
      } catch (eror) {
        emit(EmailResetPasswordEror(eror.toString()));
      }
    });

    on<ResetPasswordEvent>((event, emit) async {
      emit(ResetPasswordLoading());
      try {
        var response = await _authServices.resetPasswordServices(
          event.email,
          event.code,
          event.password,
          event.confirmPassword,
        );

        response
            ? emit(ResetPasswordSucces())
            : emit(const ResetPasswordEror("Reset password fail"));
      } catch (eror) {
        emit(ResetPasswordEror(eror.toString()));
      }
    });

    on<LoginGoogleEvent>((event, emit) async {
      try {
        var firebaseSigin = await _authServices.signinFirebase();

        if (firebaseSigin != null) {
          emit(LoginLoading());

          var response = await _authServices.loginWithGoogle(
            firebaseSigin['name'],
            firebaseSigin['email'],
          );

          if (response != null) {
            response ? emit(LoginSuccess()) : emit(UserSurvey());
          }
        } else {
          emit(LoginGoogleCancel());
        }
      } catch (eror) {
        emit(LoginEror(eror.toString()));
      }
    });
  }
}
