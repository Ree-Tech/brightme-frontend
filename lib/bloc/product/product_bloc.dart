import 'package:bloc/bloc.dart';
import 'package:bright_me/models/product.dart';
import 'package:bright_me/services/product_services.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductServices _productServices = ProductServices();
  ProductBloc() : super(ProductInitial()) {
    on<FetchListAllProduct>((event, emit) async {
      emit(AllProductLoading());
      try {
        var response = await _productServices.fetchAllProduct();

        if (response) {
          emit(AllProductSucces());
          print("state success");
        } else {
          emit(AllProductNoData());
        }
      } catch (eror) {
        emit(AllProductEror(eror.toString()));
      }
    });

    on<FetchDetailProduct>((event, emit) async {
      emit(ProductDetailLoading());
      try {
        var response = await _productServices.fetchProductDetail(event.product);

        response != null
            ? emit(ProductDetailSucces(response))
            : emit(const ProductDetailEror("Product not found"));
      } catch (eror) {
        emit(ProductDetailEror(eror.toString()));
      }
    });
  }
}
