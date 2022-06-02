import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/krs/model_user_mahasiswa_krs.dart';
import 'package:portal_akademik/model/krs/model_user_mahasiswa_paket_semester.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/krs/model_user_mahasiswa_paket_semester_list.dart';

class UserMahasiswaKrsState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaKrs? data;
  ModelUserMahasiswaPaketSemester? dataPaketSemester;
  ModelMahasiswaPaketSemester? paketSemester;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaKrsState() {
    initData();
    initDataPaketSemester();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getListKrsMahasiswa(ApiLocalStorage.semesterAktif!.rows![0].semesterAktif);
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaKrs.fromMap(res.data);
      UtilLogger.log('KRS', data?.toJson());
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> initDataPaketSemester() async {
    final res = await NetworkRepository().getSemesterTawar();
    if (res.code == CODE.SUCCESS) {
      dataPaketSemester = ModelUserMahasiswaPaketSemester.fromMap(res.data);
      UtilLogger.log('Paket Semester', dataPaketSemester!.toJson());
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