import 'package:admin/constants.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class model_login {
  String baseUrl = base_url;

  Future<List> select_data_login(String username, String password) async {
    Dio().options.contentType = Headers.formUrlEncodedContentType;
    final response = await Dio().post(
      "http://nurrachmadwidyanto.web.id/users_dragon.php",
      data: {"username": username, "password": password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    var results2 = json.decode(response.toString());
    return results2['data'];
  }
}
