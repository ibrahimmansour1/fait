import 'package:shared_preferences/shared_preferences.dart';


class AppSharedPreference {
  static late SharedPreferences sharedPreference;

  static const _PRIMARY_COLOR_KEY = 'primaryColor';
  static const _THEME_MODE_KEY = 'themeMode';
  static const _USERNAME_KEY = 'username';
  static const _USER_EMAIL_KEY = 'user_email';
  static const _USER_PASSWORD_KEY = 'user_password';
  static const _USER_TOKEN_KEY = 'user_token';

  static Future init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }



  static void savePrimaryColor(String colorName) {
    sharedPreference.setString(_PRIMARY_COLOR_KEY, colorName);
  }

  static String getPrimaryColor() {
    final String colorName =
        sharedPreference.getString(_PRIMARY_COLOR_KEY) ?? 'blue';
    return colorName;
  }

  static void saveThemeMode(String themeModeName) {
    sharedPreference.setString(_THEME_MODE_KEY, themeModeName);
  }

  static String getThemeMode() {
    final String themeModeName =
        sharedPreference.getString(_THEME_MODE_KEY) ?? 'light';
    return themeModeName;
  }

  static void saveUsername(String username) {
    sharedPreference.setString(_USERNAME_KEY, username);
  }

  static String getUsername() {
    final String username = sharedPreference.getString(_USERNAME_KEY) ?? '';
    return username;
  }

  static void saveUserEmail(String email) {
    sharedPreference.setString(_USER_EMAIL_KEY, email);
  }

  static String getUserEmail() {
    final String email = sharedPreference.getString(_USER_EMAIL_KEY) ?? '';
    return email;
  }

  static void saveUserPassword(String password) {
    sharedPreference.setString(_USER_PASSWORD_KEY, password);
  }

  static String getUserPassword() {
    final String password =
        sharedPreference.getString(_USER_PASSWORD_KEY) ?? '';
    return password;
  }

  static void saveUserToken(String token) {
    sharedPreference.setString(_USER_TOKEN_KEY, token);
  }

  static String getUserToken() {
    final String token = sharedPreference.getString(_USER_TOKEN_KEY) ?? '';
    return token;
  }

  static void clearUserData() {
    sharedPreference.remove(_USERNAME_KEY);
    sharedPreference.remove(_USER_EMAIL_KEY);
    sharedPreference.remove(_USER_PASSWORD_KEY);
    sharedPreference.remove(_USER_TOKEN_KEY);
  }
}
