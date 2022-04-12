import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/jadwal/model_user_mahasiswa_jadwal_uas.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

class UserMahasiswaJadwalUasState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaJadwalUas? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaJadwalUasState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getJadwalUasMahasiswa();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaJadwalUas.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Jadwal UAS Mahasiswa', data);
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
