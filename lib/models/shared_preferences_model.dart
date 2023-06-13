import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesModel {
  final SharedPreferences prefs;
  SharedPreferencesModel(this.prefs);

  void setUserEmail(String value) {
    prefs.setString("useremail", value);
  }

  String getUserEmailText() {
    return prefs.getString("useremail") ?? "";
  }

  void setPassword(String value) {
    prefs.setString("password", value);
  }

  String getPassword() {
    return prefs.getString("password") ?? "";
  }

  void setLoginStatus(bool value) {
    prefs.setBool("loginStatus", value);
  }

  bool getLoginStatus() {
    return prefs.getBool("loginStatus") ?? false;
  }
}
