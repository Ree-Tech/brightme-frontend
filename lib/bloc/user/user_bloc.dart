import 'package:bloc/bloc.dart';
import 'package:bright_me/services/user_services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserServices _userServices = UserServices();
  UserBloc() : super(UserInitial()) {
    on<FetchUserEvent>((event, emit) async {
      emit(FetchUserLoading());
      try {
        var response = await _userServices.fetchUserProfile();
        response
            ? emit(FetchUserSuccess())
            : emit(const FetchUserEror("Cannot get user profile"));
      } catch (eror) {
        emit(
            FetchUserEror("There is eror FetchUserEvent : ${eror.toString()}"));
      }
    });
  }
}
