import 'package:flutter/foundation.dart';
import 'package:portal_akademik/config/preference.dart';
import 'package:portal_akademik/data/repository/login_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/model/model_token.dart';
import 'package:portal_akademik/util/api/jwt_decode.dart';
import 'package:portal_akademik/util/service/logger.dart';
import 'package:portal_akademik/util/service/util_preference.dart';

class AuthState with ChangeNotifier {
  bool isLogged = false;
  bool isLoading = false;
  bool showPassword = false;
  // UserIntegrasiModel userIntegrasi;
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

      UtilLogger.log('LOGGIN ?', isLogged);

      notifyListeners();
    } catch (e) {
      UtilLogger.log('ADA ERROR CUY', e);
      notifyListeners();
    }
  }

  auth(String? username, String? password) async {
    final auth = await LoginRepository().auth(username, password);

    if (auth.code == CODE.SUCCESS) {
      Token token = Token.fromJson(parseJwt(auth.data['accessToken']));
      
      UtilPreferences.setToken(
          accessToken: auth.data['accessToken'],
          refreshToken: auth.data['refreshToken']);
      
      UtilPreferences.setUser(
        username: token.user?.username
      );

      isLogged = true;
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