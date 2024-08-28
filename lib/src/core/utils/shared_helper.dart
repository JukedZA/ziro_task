import 'package:shared_preferences/shared_preferences.dart';
import 'package:transaction_management_app/src/core/utils/constants.dart';

class SharedHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void login(String username, String password) {
    prefs.setString(usernameKey, username);
    prefs.setString(passKey, password);
  }

  static void logout() {
    prefs.clear();
  }

  static String? get username {
    return prefs.getString(usernameKey);
  }

  static String? get password {
    return prefs.getString(passKey);
  }
}
