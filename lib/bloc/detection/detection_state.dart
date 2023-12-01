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

final class SaveImageLoading extends DetectionState {}

final class SaveImageSuccess extends DetectionState {}

final class SaveImageEror extends DetectionState {
  final String text;

  const SaveImageEror(this.text);

  @override
  List<Object> get props => [text];
}
