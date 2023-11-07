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
        currUser = UserModel(
            id: data['id'],
            name: data['name'],
            email: data['email'],
            address: data['address'],
            phone: data['phone'],
            birthdate: data['birthdate'],
            roleId: data['roleId'],
            gender: data['gender'],
            jwt: currUser.jwt);

        return true;
      }
    } catch (eror) {
      throw Exception("eror at fetchUserProfile ${eror.toString()}");
    }
    return false;
  }

  Future<bool> updateUserProile(UserModel updateUser) async {
    try {
      var response = await _dio.post(
        "$base/user/update",
        options: Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}),
        data: {
          'name': updateUser.name,
          'address': updateUser.address,
          'email': updateUser.email,
          'password': null,
          'phone': updateUser.phone,
          'role_id': updateUser.roleId,
          'birthdate': updateUser.birthdate,
          'gender': updateUser.gender,
        },
      );

      if (response.statusCode == 200) {
        var data = response.data['data'];
        currUser = UserModel(
          id: currUser.id,
          name: data['name'],
          email: data['email'],
          address: data['address'],
          phone: data['phone'],
          birthdate: data['birthdate'],
          roleId: currUser.roleId,
          gender: data['gender'],
          jwt: currUser.jwt,
        );
        return true;
      }
    } catch (eror) {
      throw Exception("eror at updateUserProile ${eror.toString()}");
    }
    return false;
  }

  Future<bool> surveyUser(
    String age,
    String skinType,
    String skinProblem,
  ) async {
    try {
      var response = await _dio.post("$base/survey/create",
          data: {
            'age': age,
            'skin_type': skinType,
            'skin_problem': skinProblem,
          },
          options:
              Options(headers: {'Authorization': 'Bearer ${currUser.jwt}'}));

      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at surveyUser ${eror.toString()}");
    }
    return false;
  }
}
