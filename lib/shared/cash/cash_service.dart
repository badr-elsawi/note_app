import 'package:shared_preferences/shared_preferences.dart';

class CashService {
  static late SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> setBool({
    required String key,
    required bool value,
  }) async {
    print('data cashed **************************************************');
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBool({
    required String key,
  }) {
    print('data fetched **************************************************');
    return sharedPreferences.getBool(key);
  }
}
