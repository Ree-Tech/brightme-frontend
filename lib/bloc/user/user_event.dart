part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends UserEvent {}

class UpdateProfileUserEvent extends UserEvent {
  final UserModel updateUser;

  const UpdateProfileUserEvent(this.updateUser);

  @override
  List<Object> get props => [updateUser];
}

class SurveyUserEvent extends UserEvent {
  final String age;
  final String skinType;
  final String skinProblem;

  const SurveyUserEvent(this.age, this.skinType, this.skinProblem);

  @override
  List<Object> get props => [age, skinType, skinProblem];
}
