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

        if (response) emit(LoginSuccess());
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
  }
}
