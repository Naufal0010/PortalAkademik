import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/kuesioner/model_user_mahasiswa_data_pelayanan.dart';

class UserMahasiswaDataPelayananState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaDataKuesionerPelayanan? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaDataPelayananState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getDataKuesionerPelayanan();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaDataKuesionerPelayanan.fromMap(res.data);
      UtilLogger.log('Data Kuesioner Pelayanan', data?.toJson());
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    error = null;
    data = null;
    isLoading = true;
    notifyListeners();
    initData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}