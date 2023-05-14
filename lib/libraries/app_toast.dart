import 'package:fluttertoast/fluttertoast.dart';
import 'package:media_feed_app/styles/colors.dart';

class AppToast {
  static void showError(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: AppColors.pink,
      textColor: AppColors.white,
      fontSize: 16.0,
    );
  }
}
