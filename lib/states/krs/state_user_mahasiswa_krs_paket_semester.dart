import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/krs/model_user_mahasiswa_krs_paket_semester.dart';

class UserMahasiswaKrsPaketSemesterState with ChangeNotifier, DiagnosticableTreeMixin {
  ModelUserMahasiswaKrsPaket? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String paketId) async {
    final res = await NetworkRepository().getListMataKuliahPaketSemester(paketId);
    if (res.code == CODE.SUCCESS) {
      data = ModelUserMahasiswaKrsPaket.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Krs Paket Semester', data?.toJson());
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
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
