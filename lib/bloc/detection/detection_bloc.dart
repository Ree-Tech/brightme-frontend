import 'package:bloc/bloc.dart';
import 'package:bright_me/services/detection_services.dart';
import 'package:equatable/equatable.dart';

part 'detection_event.dart';
part 'detection_state.dart';

class DetectionBloc extends Bloc<DetectionEvent, DetectionState> {
  DetectionBloc() : super(DetectionInitial()) {
    final DetectionServices detectionServices = DetectionServices();
    on<PostPhotoDetectionEvent>((event, emit) async {
      emit(PostDetectionLoading());
      try {
        var response = await detectionServices.postDetection(event.imagePath);

        response
            ? emit(PostDetectionSuccess())
            : emit(const PostDetectionEror("faild upload"));
      } catch (eror) {
        emit(PostDetectionEror(eror.toString()));
      }
    });

    on<SaveImageEvent>((event, emit) async {
      emit(SaveImageLoading());
      try {
        var response = await detectionServices.saveImage(event.imagePath);

        response
            ? emit(SaveImageSuccess())
            : emit(const SaveImageEror("fail save image"));
      } catch (eror) {
        emit(SaveImageEror(eror.toString()));
      }
    });
  }
}
