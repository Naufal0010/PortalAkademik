import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portal_akademik/config/config.dart';
import 'package:portal_akademik/model/model_api.dart';
import 'package:portal_akademik/util/api/consumer.dart';
import 'package:portal_akademik/util/service/util_preference.dart';

class LoginRepository {

  String? username = UtilPreferences.getString('username');

  static ApiConsumer consumer = ApiConsumer(
      apiUrl: !kDebugMode
          ? 'http://api-siapps.gov.id/api'
          : 'https://git.ulm.ac.id/api-siapps/public/api',
      appId: 'PortalAkademik',
      apiKey: '605dafe39ee0780e8cf2c829434eea11',
      // apiToken: UtilPreferences.getString(Preferences.accessToken),
      apiTimeout: 20);

  Future<ApiModel> getUser() async {

    return await consumer
        .limit(20)
        .orderBy({'tanggal': 'DESC'}).execute(url: '/akademik/mahasiswa/profil/$username');
  }

  /*
   * Refresh token jika acces token expired
   */
  Future refreshToken() async {
    FormData formData = FormData.fromMap({
      "tokenRefresh": UtilPreferences.getString(Preferences.refreshToken),
    });

    final response = await consumer.execute(
        url: '/auth/refresh', formData: formData, method: MethodRequest.PUT);

    if (response.code == CODE.SUCCESS) {
      return response.data['accessToken'];
    } else {
      return null;
    }
  }

  Future auth(String? username, String? password) async {
    return await consumer.auth(username: username, password: password);
  }

  ///Singleton factory
  static final LoginRepository _instance = LoginRepository._internal();

  factory LoginRepository() {
    return _instance;
  }

  LoginRepository._internal();
}