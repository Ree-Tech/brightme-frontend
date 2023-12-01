part of 'detection_bloc.dart';

sealed class DetectionEvent extends Equatable {
  const DetectionEvent();

  @override
  List<Object> get props => [];
}

final class PostPhotoDetectionEvent extends DetectionEvent {
  final String imagePath;

  const PostPhotoDetectionEvent(this.imagePath);

  @override
  List<Object> get props => [imagePath];
}

final class SaveImageEvent extends DetectionEvent {
  final String imagePath;

  const SaveImageEvent(this.imagePath);

  @override
  List<Object> get props => [imagePath];
}
