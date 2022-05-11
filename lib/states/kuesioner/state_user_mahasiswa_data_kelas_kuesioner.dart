import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/kuesioner/evaluasidosen/model_evaluasi_dosen_tambah_data.dart';
import '../../model/kuesioner/model_user_mahasiswa_data_kelas_kuesioner.dart';

class UserMahasiswaDataKelasKuesionerState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaDataKelasKuesioner? data;
  ModelEvaluasiDosenTambahData? evaluasiDosenTambahData;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaDataKelasKuesionerState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getDataKelasKuesioner();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaDataKelasKuesioner.fromMap(res.data);
      UtilLogger.log('Data Kelas Kuesioner', data?.toJson());
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> postDataKuesionerEvaluasiDosen() async {
    final res =
    await NetworkRepository().tambahDataKuesionerEvaluasiDosen(evaluasiDosenTambahData!);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      UtilLogger.log('Post data kuesioner pelayanan', data);
    } else {
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