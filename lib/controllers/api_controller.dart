import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/controllers/helpers/api_helper_class.dart';
import 'package:wallpaper_app/modal/api_modal_class.dart';

class ApiController extends ChangeNotifier {
  ApiModal? post;

  Future<void> getData() async {
    post = await ApiHelpers.apiHelpers.getSingleResponse();
    notifyListeners();
  }
}
