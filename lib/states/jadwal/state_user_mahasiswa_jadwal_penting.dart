import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/jadwal/model_user_mahasiswa_jadwal_penting.dart';
import 'package:portal_akademik/model/model.dart';

class UserMahasiswaJadwalPentingState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaJadwalPenting? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaJadwalPentingState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getJadwalPentingMahasiswa();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaJadwalPenting.fromMap(res.data);
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