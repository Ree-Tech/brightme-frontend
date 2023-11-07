part of 'detection_bloc.dart';

sealed class DetectionState extends Equatable {
  const DetectionState();

  @override
  List<Object> get props => [];
}

final class DetectionInitial extends DetectionState {}

final class PostDetectionLoading extends DetectionState {}

final class PostDetectionSuccess extends DetectionState {}

final class PostDetectionEror extends DetectionState {
  final String text;

  const PostDetectionEror(this.text);

  @override
  List<Object> get props => [text];
}
