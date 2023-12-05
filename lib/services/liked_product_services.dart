import 'package:bright_me/models/liked_product.dart';
import 'package:bright_me/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio _dio = Dio();
var base = dotenv.env['BASE_URL'];

class LikedProductServices {
  Future<List<Map<String, int>>> fetchLikedProduct() async {
    List<Map<String, int>> dataLike = [];
    try {
      var respose = await _dio.get("$base/liked-products",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));

      if (respose.statusCode == 200) {
        if ((respose.data['data'] as List).isNotEmpty) {
          for (var item in respose.data['data']) {
            Map<String, int> dataJson = {
              "id": item["id"],
              "varianId": item["product_variation_id"],
            };
            dataLike.add(dataJson);
          }
        }
      }
    } catch (eror) {
      throw Exception("eror at: ${eror.toString()}");
    }
    return dataLike;
  }

  Future<int?> addLikeProduct(int id) async {
    try {
      var respose = await _dio.post("$base/liked-products/create",
          data: {
            "product_variation_id": id,
          },
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));

      if (respose.statusCode == 200) {
        return respose.data['data']['id'];
      }
    } catch (eror) {
      throw Exception("eror at: ${eror.toString()}");
    }
    return null;
  }

  Future<bool> deleteLikeProduct(int id) async {
    try {
      var respose = await _dio.delete("$base/liked-products/delete/$id",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));

      if (respose.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at: ${eror.toString()}");
    }
    return false;
  }
}
