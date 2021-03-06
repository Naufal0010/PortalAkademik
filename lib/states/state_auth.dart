import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/config/preference.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';
import 'package:portal_akademik/util/service/util_preference.dart';

class AuthState with ChangeNotifier {
  bool isLogged = false;
  bool isLoading = true;
  bool showPassword = false;
  Map<String, dynamic>? error;

  AuthState() {
    initData();
  }

  initData() async {
    try {
      ///Setup SharedPreferences
      final hasToken = UtilPreferences.containsKey(Preferences.refreshToken);

      if (hasToken!) {
        isLogged = true;
      } else {
        isLogged = false;
      }

      UtilLogger.log('Login: ', isLogged);

      notifyListeners();
    } catch (e) {
      UtilLogger.log('Error: ', e);
      notifyListeners();
    }
  }

  auth(String? username, String? password) async {
    final auth = await NetworkRepository().auth(username, password);

    if (auth.code == CODE.SUCCESS) {
      UtilPreferences.setToken(
          accessToken: auth.data['accessToken'],
          refreshToken: auth.data['refreshToken']);
      
      UtilPreferences.setUser(
        username: username
      );

      UtilLogger.log('Username', UtilPreferences.getString('username'));

      isLogged = true;
      isLoading = false;
      notifyListeners();
    } else {
      Fluttertoast.showToast(
          msg: "Username atau password salah!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      isLoading = true;
      error = auth;
      notifyListeners();
    }
  }

  logout() async {
    UtilPreferences.remove(Preferences.accessToken);
    UtilPreferences.remove(Preferences.refreshToken);
    isLogged = false;
    notifyListeners();
  }
}