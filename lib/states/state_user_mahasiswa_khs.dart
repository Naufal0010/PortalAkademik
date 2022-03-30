import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/util/service/logger.dart';

class UserMahasiswaKhsState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelKhsMahasiswa? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String semester) async {
    final res = await NetworkRepository().getKhsPerSemesterMahasiswa(
        semester,
        ApiLocalStorage.userModelMahasiswa!.kodeProdi,
        ApiLocalStorage.userModelMahasiswa!.prodi!.jenjang,
        ApiLocalStorage.userModelMahasiswa!.angkatan);
    if (res.code == CODE.SUCCESS) {
      data = UserModelKhsMahasiswa.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Khs Semester Data', data?.khs?.toJson());
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
