import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_semester_aktif.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../util/api_local_store.dart';


class UserMahasiswaSemesterAktifState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelSemesterAktif? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaSemesterAktifState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getSemesterAktif();
    if (res.code == CODE.SUCCESS) {
      data = UserModelSemesterAktif.fromMap(res.data);
      UtilLogger.log('Semester Aktif', data?.toJson());
      ApiLocalStorage.semesterAktif = data;
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