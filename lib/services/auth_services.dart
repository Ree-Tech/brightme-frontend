import 'package:bright_me/models/user.dart';
import 'package:bright_me/services/cache_services.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<bool?> loginServices(
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

        return reseponse.data['data']['is_survey'];
      }
    } catch (eror) {
      throw Exception("eror at loginServices: ${eror.toString()} ");
    }
    return null;
  }

  Future<Map<String, dynamic>?> signinFirebase() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(scopes: <String>['email']);
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        // Pengguna membatalkan proses login
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await firebaseAuth.signInWithCredential(credential);
      var email = firebaseAuth.currentUser!.email;
      var name = firebaseAuth.currentUser!.displayName;

      Map<String, dynamic> userData = {
        'email': email,
        'name': name,
      };

      googleSignIn.disconnect();
      await firebaseAuth.signOut();

      return userData;
    } catch (error) {
      throw Exception(error.toString());
    } finally {}
  }

  Future<bool?> loginWithGoogle(
    String name,
    String email,
  ) async {
    try {
      var reseponse = await _dio.post("$base/auth/firebase", data: {
        'name': name,
        'email': email,
      });

      if (reseponse.statusCode == 200) {
        var token = reseponse.data['data']['token'];
        currUser.jwt = token;
        await Cache.writeData(key: user!, value: token);

        return reseponse.data['data']['is_survey'];
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }

    return null;
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
        currUser = UserModel(
          id: null,
          name: null,
          email: null,
          address: null,
          phone: null,
          birthdate: null,
          roleId: null,
          gender: null,
          jwt: null,
        );
        return true;
      }
    } catch (eror) {
      throw Exception("eror at logoutServices: ${eror.toString()} ");
    }
    return false;
  }

  Future<bool> emailResetPasswordServices(String email) async {
    try {
      var response = await _dio.post("$base/auth/forgot", data: {
        'email': email,
      });

      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at resetPasswordServices: ${eror.toString()} ");
    }
    return false;
  }

  Future<bool> resetPasswordServices(
    String email,
    String code,
    String password,
    String confirmPassword,
  ) async {
    try {
      var response = await _dio.post("$base/auth/forgot/submit", data: {
        "email": email,
        "code": code,
        "password": password,
        "password_confirmation": confirmPassword,
      });

      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception("eror at resetPasswordServices: ${eror.toString()} ");
    }
    return false;
  }
}
