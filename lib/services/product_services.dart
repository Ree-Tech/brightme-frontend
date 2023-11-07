import 'package:bright_me/models/product.dart';
import 'package:bright_me/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio _dio = Dio();
var base = dotenv.env['BASE_URL'];

class ProductServices {
  Future<bool> fetchAllProduct() async {
    try {
      var response = await _dio.get("$base/products?page=1&limit=10&search",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));
      if (response.statusCode == 200) {
        var data = response.data['data']['data'];
        for (var item in (data as List<dynamic>)) {
          Product dataJson = Product.fromJson(item);
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
}
