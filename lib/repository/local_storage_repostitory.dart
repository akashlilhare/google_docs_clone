import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepository {
  Future setToken(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("x-auth-token", token);
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? token = pref.getString("x-auth-token");
    return token;
  }
}
