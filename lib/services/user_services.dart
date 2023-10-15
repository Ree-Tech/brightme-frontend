import 'package:bright_me/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio _dio = Dio();
var base = dotenv.env['BASE_URL'];
var user = dotenv.env['USER'];

class UserServices {
  Future<bool> fetchUserProfile() async {
    try {
      var reseponse = await _dio.get("$base/user/profile",
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));
      if (reseponse.statusCode == 200) {
        var data = reseponse.data['data']['user'];
        currUser = User(
            id: data['id'],
            name: data['name'],
            email: data['email'],
            address: data['address'],
            phone: data['phone'],
            birthdate: data['birthdate'],
            roleId: data['roleId'],
            jwt: currUser.jwt);

        return true;
      }
    } catch (eror) {
      throw Exception("eror at fetchUserProfile ${eror.toString()}");
    }
    return false;
  }
}
