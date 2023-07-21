import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/controllers/helpers/api_helper_class.dart';
import 'package:wallpaper_app/modal/api_modal_class.dart';

class ApiController extends ChangeNotifier {
  ApiModal? post;
  List tags = [
    "bird",
    "flowers",
    "monk",
    "music",
    "Tree",
    "tiger",
    "4k WallPaper",
    "nature",
  ];
  List data = [];

  ApiController() {
    search();
  }

  Future<void> getData() async {
    post = await ApiHelpers.apiHelpers.getSingleResponse();
    notifyListeners();
  }

  search({String val = 'nature'}) async {
    data = await ApiHelpers.apiHelpers.getWallpaperResponse(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}
