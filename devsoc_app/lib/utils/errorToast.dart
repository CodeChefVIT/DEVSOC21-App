import 'package:devsoc_app/helpers/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

ThemeHelper t = ThemeHelper();

showErrorToast(String message) {
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 2,
    backgroundColor: t.errorColor,
    textColor: t.white,
    fontSize: 16.0,
  );
}
