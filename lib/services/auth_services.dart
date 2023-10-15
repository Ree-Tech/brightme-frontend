import 'package:bright_me/models/user.dart';
import 'package:bright_me/services/cache_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio _dio = Dio();
var base = dotenv.env['BASE_URL'];
var user = dotenv.env['USER'];

class AuthServices {
  Future<bool> hasLogin() async {
    try {
      var response = await Cache.getData(user!);

      if (response != null) {
        currUser.jwt = response;
        return true;
      }
    } catch (eror) {
      throw Exception("eror at hasLogin ${eror.toString()}");
    }
    return false;
  }

  Future<bool> loginServices(
    String email,
    String password,
  ) async {
    try {
      var reseponse = await _dio.post("$base/auth/login", data: {
        'email': email,
        'password': password,
      });

      if (reseponse.statusCode == 200) {
        var token = reseponse.data['data']['token'];
        currUser.jwt = token;
        await Cache.writeData(key: user!, value: token);

        return true;
      }
    } catch (eror) {
      throw Exception("eror at loginServices: ${eror.toString()} ");
    }
    return false;
  }

  Future<bool> registerServices(
    String email,
    String password,
    String name,
  ) async {
    try {
      var reseponse = await _dio.post("$base/auth/register", data: {
        'name': name,
        'email': email,
        'password': password,
      });

      if (reseponse.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at registerServices: ${eror.toString()} ");
    }
    return false;
  }

  Future<bool> verifikasiAccountServices(
    String email,
    String code,
  ) async {
    try {
      var reseponse = await _dio.post("$base/auth/confirm", data: {
        'email': email,
        'code': code,
      });

      if (reseponse.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at verifikasiAccountServices: ${eror.toString()} ");
    }
    return false;
  }

  Future<bool> logoutServices() async {
    try {
      var response = await _dio.post("$base/auth/logout",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));

      if (response.statusCode == 200) {
        await Cache.deleteData(user!);
        return true;
      }
    } catch (eror) {
      throw Exception("eror at logoutServices: ${eror.toString()} ");
    }
    return false;
  }
}
