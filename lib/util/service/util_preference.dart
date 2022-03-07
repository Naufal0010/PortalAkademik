import 'package:portal_akademik/config/application.dart';
import 'package:portal_akademik/config/preference.dart';
import 'package:portal_akademik/util/service/logger.dart';

class UtilPreferences {
  static Future<bool>? clear() {
    return Application.preferences?.clear();
  }

  static bool? containsKey(String key) {
    return Application.preferences?.containsKey(key);
  }

  static dynamic get(String key) {
    return Application.preferences?.get(key);
  }

  static bool? getBool(String key) {
    return Application.preferences?.getBool(key);
  }

  static double? getDouble(String key) {
    return Application.preferences?.getDouble(key);
  }

  static int? getInt(String key) {
    return Application.preferences?.getInt(key);
  }

  static Set<String>? getKeys() {
    return Application.preferences?.getKeys();
  }

  static String? getString(String key) {
    return Application.preferences?.getString(key);
  }

  static List<String>? getStringList(String key) {
    return Application.preferences?.getStringList(key);
  }

  static Future<void>? reload() {
    return Application.preferences?.reload();
  }

  static Future<bool>? remove(String key) {
    return Application.preferences?.remove(key);
  }

  static Future<bool>? setBool(String key, bool value) {
    return Application.preferences?.setBool(key, value);
  }

  static Future<bool>? setDouble(String key, double value) {
    return Application.preferences?.setDouble(key, value);
  }

  static Future<bool>? setInt(String key, int value) {
    return Application.preferences?.setInt(key, value);
  }

  static Future<bool>? setString(String key, String value) {
    return Application.preferences?.setString(key, value);
  }

  static Future<bool>? setStringList(String key, List<String> value) {
    return Application.preferences?.setStringList(key, value);
  }

  /*
   * Ambil access dan refresh token ke cache
   */
  static Map<String, dynamic>? getToken() {
    return {
      'accessToken':
      Application.preferences?.getString(Preferences.accessToken),
      'refreshToken':
      Application.preferences?.getString(Preferences.refreshToken),
    };
  }

  /*
   * Simpan access dan refresh token ke cache
   */
  static void setToken({String? accessToken, String? refreshToken}) {
    if (accessToken != null) {
      Application.preferences?.setString(Preferences.accessToken, accessToken);
      UtilLogger.log(
          'Acess token', UtilPreferences.getString(Preferences.accessToken));
    }

    if (refreshToken != null) {
      Application.preferences
          ?.setString(Preferences.refreshToken, refreshToken);
    }
  }

  static void setUser({String? username, String? password}) {
    if (username != null) {
      Application.preferences?.setString('username', username);

      UtilLogger.log('username', UtilPreferences.getString('username'));
    }

  }

  ///Singleton factory
  static final UtilPreferences _instance = UtilPreferences._internal();

  factory UtilPreferences() {
    return _instance;
  }

  UtilPreferences._internal();
}
