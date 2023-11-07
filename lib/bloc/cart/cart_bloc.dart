import 'package:bloc/bloc.dart';
import 'package:bright_me/services/cart_services.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    final CartServices cartServices = CartServices();
    on<FetchListCartEvent>((event, emit) async {
      emit(FetchCartLoading());
      try {
        var response = await cartServices.fetchListCart();
        if (response != null) {
          response ? emit(FetchCartSuccess()) : emit(FetchCartNoData());
        }
      } catch (eror) {
        emit(FetchCartEror(eror.toString()));
      }
    });

    on<AddCartItemEvent>((event, emit) async {
      emit(AddCartItemLoading());
      try {
        var response = await cartServices.addCartItem(event.id);
        response
            ? emit(AddCartItemSuccess())
            : emit(const AddCartItemEror("fail add item"));
      } catch (eror) {
        emit(AddCartItemEror(eror.toString()));
      }
    });

    on<UpdateQuantityItemEvent>((event, emit) async {
      emit(UpdateQuantityItemLoading());
      try {
        var response = await cartServices.updateItemQuantity(
          event.quantity,
          event.id,
        );

        response
            ? emit(UpdateQuantityItemSuccess())
            : emit(const UpdateQuantityItemEror("fail"));
      } catch (eror) {
        emit(UpdateQuantityItemEror(eror.toString()));
      }
    });

    on<UpdateCheckItemEvent>((event, emit) async {
      emit(UpdateCheckItemLoading());
      try {
        var response = await cartServices.updateCheckItem(
          event.check,
          event.id,
        );

        response
            ? emit(UpdateCheckItemSuccess())
            : emit(const UpdateCheckItemEror("fail"));
      } catch (eror) {
        emit(UpdateCheckItemEror(eror.toString()));
      }
    });

    on<DeleteCartItemEvent>((event, emit) async {
      emit(DeleteCartItemLoading());
      try {
        var response = await cartServices.deteleItemCart(
          event.id,
        );
        response
            ? emit(DeleteCartItemSuccess())
            : emit(const DeleteCartItemEror("Fail"));
      } catch (eror) {
        emit(DeleteCartItemEror(eror.toString()));
      }
    });
  }
}
