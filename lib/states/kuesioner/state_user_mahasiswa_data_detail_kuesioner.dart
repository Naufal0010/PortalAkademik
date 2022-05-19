import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/kuesioner/model_user_mahasiswa_data_detail_kuesioner.dart';

class UserMahasiswaDataDetailKuesionerState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaDataDetailKuesioner? data;
  Map<String, dynamic>? error;
  String errorMessage = '';
  bool isLoading = true;

  Future<void> initData(String idKelas) async {
    final res = await NetworkRepository().getDataDetailKuesioner(idKelas);
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaDataDetailKuesioner.fromMap(res.data);
      UtilLogger.log('Data Kelas Kuesioner', data?.toJson());
      isLoading = false;
      notifyListeners();
    } else if (res.code == CODE.ERROR) {
      isLoading = false;
      error = res.message;
      notifyListeners();
    } else {
      isLoading = false;
      errorMessage = res.message;
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    error = null;
    data = null;
    errorMessage = '';
    isLoading = true;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}