import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/util/service/logger.dart';
import '../model/model_user_mahasiswa_rekap_hasil_studi.dart';

class UserMahasiswaRekapHasilStudiState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelRekapHasilStudi? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData() async {
    final res = await NetworkRepository().getTranskripHasilStudiMahasiswa(
        ApiLocalStorage.userModelMahasiswa!.prodi!.jenjang,
        ApiLocalStorage.userModelMahasiswa!.angkatan);
    if (res.code == CODE.SUCCESS) {
      data = UserModelRekapHasilStudi.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Transkrip Hasil Studi', data);
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
