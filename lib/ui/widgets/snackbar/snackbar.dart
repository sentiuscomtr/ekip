import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';

class CustomSnackbar {
  static getSnackbar(String title, String message, SnackbarType type) {
    var color = type == SnackbarType.SUCCESS
        ? green.withOpacity(0.4)
        : red.withOpacity(0.4);
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      backgroundColor: color,
    ));
  }
}

enum SnackbarType { ERROR, SUCCESS }
