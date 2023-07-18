import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/modal/api_modal_class.dart';

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelpers = ApiHelpers._();

  String api = "https://dummyjson.com/posts/10";

  Future<ApiModal?> getSingleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      ApiModal post = ApiModal.fromMap(data: data);

      return post;
    }
  }
}
