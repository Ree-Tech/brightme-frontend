import 'package:bloc/bloc.dart';
import 'package:bright_me/models/user.dart';
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

    on<SurveyUserEvent>((event, emit) async {
      emit(SurveyUserLoading());
      try {
        var response = await _userServices.surveyUser(
            event.age, event.skinType, event.skinProblem);

        response
            ? emit(SurveyUserSuccess())
            : emit(const SurveyUserEror("upload survey fail"));
      } catch (eror) {
        emit(SurveyUserEror(eror.toString()));
      }
    });

    on<UpdateProfileUserEvent>((event, emit) async {
      emit(UpdateProfileUserLoading());
      try {
        var response = await _userServices.updateUserProile(event.updateUser);

        response
            ? emit(UpdateProfileUserSuccess())
            : emit(const UpdateProfileUserEror("update profile fail"));
      } catch (eror) {
        emit(UpdateProfileUserEror(eror.toString()));
      }
    });
  }
}
