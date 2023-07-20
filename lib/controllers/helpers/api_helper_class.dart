import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/modal/api_modal_class.dart';

class ApiHelpers {
  ApiHelpers._();

  static final ApiHelpers apiHelpers = ApiHelpers._();

  String api = "https://jsonplaceholder.typicode.com/posts";

  Future<List?> getWallpaperResponse() async {
    String wallpaperApi =
        "https://pixabay.com/api/?key=38361497-af0d03b7f3d6a8dab35733f78";
    http.Response response = await http.get(Uri.parse(wallpaperApi));

    if (response.statusCode == 200) {
      var wallpaper = jsonDecode(response.body);

      List allWallpaper = wallpaper['hits'];

      return allWallpaper;
    }
  }

  Future<ApiModal?> getSingleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      ApiModal post = ApiModal.fromMap(data: data);

      return post;
    }
  }

  Future<List<ApiModal>?> getMultipleResponse() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      List<ApiModal> posts =
          data.map((e) => ApiModal.fromMap(data: e)).toList();
      return posts;
    }
  }
}
