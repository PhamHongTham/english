import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static const String accessTokenKey = 'accessToken';

  static late SharedPreferences _prefs;

  static Future<void> initialise() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String? get token {
    return _prefs.getString(accessTokenKey);
  }

  static set token(String? token) =>
      _prefs.setString(accessTokenKey, token ?? '');
  static removeSeason() {
    _prefs.remove(accessTokenKey);
  }

  static bool get isLoggedIn {
    return _prefs.getString(accessTokenKey) != null;
  }

  static void clearUserData() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('fullName');
      prefs.remove('email');
      // Add any other user-related data you want to clear
    });
  }

  static getFullName() {}

  static getEmail() {}
}
