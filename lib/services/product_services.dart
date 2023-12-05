import 'package:bright_me/models/product.dart';
import 'package:bright_me/models/user.dart';
import 'package:bright_me/services/liked_product_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio _dio = Dio();
var base = dotenv.env['BASE_URL'];

class ProductServices {
  Future<bool> fetchAllProduct() async {
    spescialOffer = [];
    allProduct = [];
    populerProduct = [];
    arrivalProduct = [];
    listUserLike = [];
    final LikedProductServices likedProductServices = LikedProductServices();
    try {
      List<Map<String, int>> likeUser =
          await likedProductServices.fetchLikedProduct();
      var response = await _dio.get("$base/products?page=1&limit=10&search",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));
      if (response.statusCode == 200) {
        var data = response.data['data']['data'];
        for (var item in (data as List<dynamic>)) {
          Product dataJson = Product.fromJson(item);
          for (var like in likeUser) {
            if (dataJson.productVariations[0].id == like['varianId']) {
              dataJson.isLike = true;
              dataJson.idLike = like['id'];
              listUserLike.add(dataJson);
            }
          }

          if (dataJson.productCategory.id == 1) {
            spescialOffer.add(dataJson);
          } else if (dataJson.productCategory.id == 2) {
            populerProduct.add(dataJson);
            allProduct.add(dataJson);
          } else if (dataJson.productCategory.id == 3) {
            arrivalProduct.add(dataJson);
            allProduct.add(dataJson);
          }
        }

        return true;
      }
    } catch (eror) {
      throw Exception("eror at: ${eror.toString()}");
    }

    return false;
  }

  Future<Product?> fetchProductDetail(Product product) async {
    try {
      var response = await _dio.get("$base/products/${product.slug}",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));
      if (response.statusCode == 200) {
        var data = response.data['data'];
        Product dataJson = Product.fromJson(data);

        return dataJson;
      }
    } catch (eror) {
      throw Exception("eror at: ${eror.toString()}");
    }

    return null;
  }

  void changeLikeProduct(int id) {
    allProduct.forEach((element) {
      for (var data in element.productVariations) {
        if (data.id == id) {
          element.isLike = false;
        }
      }
    });
  }
}
