import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  Future<SharedPreferences>? _sharedPreferences;
  static const String is_dark_mode="is_dark_mode";
  static const String language_code="language_code";

  Future changeTheme(bool value){
    return _sharedPreferences!.then((pref) {
      return pref.setBool("is_dark_mode", value);
    },);
  }

  Future changeLanguage(bool value){
    return _sharedPreferences!.then((pref) {
      return pref.setBool("language_code", value);
    },);
  }

  Future<bool> get isDarkMode{
    return _sharedPreferences!.then((pref) {
      return pref.getBool("is_dark_mode")??false;
    },);
  }

  Future<String> get applocale{
    return _sharedPreferences!.then((pref) {
      return pref.getString("language_code")??"en";
    },);
  }


}