import 'dart:io';

import 'package:bright_me/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';

Dio _dio = Dio();
var base = dotenv.env['BASE_URL'];

class DetectionServices {
  Future<bool> postDetection(String imagePath) async {
    File imageFile = File(imagePath);
    var fileBytes = await imageFile.readAsBytes();
    var mfile = MultipartFile.fromBytes(
      fileBytes,
      filename: imageFile.path.split("/").last,
      contentType: MediaType("image", "*/*"),
    );

    var formData = FormData.fromMap({
      'img': mfile,
    });
    try {
      var response = await _dio.post("$base/detection",
          data: formData,
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
            'Authorization': 'Bearer ${currUser.jwt}',
          }));

      if (response.statusCode == 200) {
        return true;
      }
    } catch (eror) {
      throw Exception(eror.toString());
    }
    return false;
  }
}
