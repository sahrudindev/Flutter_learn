import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pertemuan12/models/response_model.dart';
import 'package:pertemuan12/utils/configs/api_config.dart';

class AuthServices {
  static String baseUrl = ApiConfig.baseUrl;

  Future<ResponseModel> login({ required String username, required String password }) async {
    final String url = '$baseUrl/authentications';

    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json; charset=UTF-8",
      },
      body: jsonEncode({
        "username": username,
        "password": password,
      })
    );

    final Map<String, dynamic> responseJson = jsonDecode(response.body);
    if(response.statusCode == 201) {
      // todo: save accessToken to SharedStorage
    }
    return ResponseModel.fromJson(responseJson);
  }
}