import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> cachIntialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setData({required String key, required dynamic value}) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    }

    return false;
  }

  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  dynamic deleteData({required String key}) async {
    return await sharedPreferences.remove(key);
  }
}
