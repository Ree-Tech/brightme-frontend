import 'package:bright_me/models/cart.dart';
import 'package:bright_me/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio _dio = Dio();
var base = dotenv.env['BASE_URL'];

class CartServices {
  Future<bool?> fetchListCart() async {
    userCart = [];
    try {
      var response = await _dio.get("$base/carts",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));

      if (response.statusCode == 200) {
        var data = response.data['data'];
        if ((data as List<dynamic>).isNotEmpty) {
          for (var item in data) {
            Cart dataJson = Cart.fromJson(item);
            userCart.add(dataJson);
          }
          return true;
        } else {
          return false;
        }
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }
    return null;
  }

  Future<bool> addCartItem(int id) async {
    try {
      var response = await _dio.post("$base/carts/create",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}),
          data: {
            "product_variation_id": id,
            "quantity": 1,
          });
      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }
    return false;
  }

  Future<bool> updateItemQuantity(
    int quantity,
    int id,
  ) async {
    try {
      var response = await _dio.patch("$base/carts/update/$id",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}),
          data: {
            "quantity": quantity,
          });
      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }
    return false;
  }

  Future<bool> updateCheckItem(
    int check,
    int id,
  ) async {
    try {
      var response = await _dio.patch("$base/carts/update/$id",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}),
          data: {
            "is_check": check,
          });
      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }
    return false;
  }

  Future<bool> deteleItemCart(
    int id,
  ) async {
    try {
      var response = await _dio.delete(
        "$base/carts/delete/$id",
        options: Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }
    return false;
  }
}
