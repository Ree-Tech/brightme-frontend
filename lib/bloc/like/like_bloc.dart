import 'package:bloc/bloc.dart';
import 'package:bright_me/models/product.dart';
import 'package:bright_me/services/liked_product_services.dart';
import 'package:equatable/equatable.dart';

part 'like_event.dart';
part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial()) {
    final LikedProductServices likedProductServices = LikedProductServices();

    on<AddLikedProductEvent>((event, emit) async {
      try {
        var response = await likedProductServices.addLikeProduct(event.id);

        if (response != null) {
          event.product.idLike = response;
          listUserLike.add(event.product);

          emit(AddLikeProductSuccess());
        } else {
          emit(const AddLikeProductEror("fail like product"));
        }
      } catch (eror) {
        emit(AddLikeProductEror(eror.toString()));
      }
    });

    on<DeleteLikeProductByIdEvent>((event, emit) async {
      emit(DeleteLikeProductByIdLoading());
      try {
        var response = await likedProductServices.deleteLikeProduct(event.id);

        if (response) {
          listUserLike.remove(event.product);
          emit(DeleteLikeProductByIdSuccess());
        } else {
          emit(const DeleteLikeProductByIdEror("fail unlike"));
        }
      } catch (eror) {
        emit(DeleteLikeProductByIdEror(eror.toString()));
      }
    });
  }
}
