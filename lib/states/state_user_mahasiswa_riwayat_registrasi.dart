import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_riwayat_registrasi.dart';
import 'package:portal_akademik/util/service/logger.dart';


class UserMahasiswaRiwayatRegistrasiState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMhsRiwayatRegistrasi? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaRiwayatRegistrasiState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getRiwayatRegistrasiMahasiswa();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMhsRiwayatRegistrasi.fromMap(res.data);
      UtilLogger.log('RiwayatRegistrasi State : ', data?.toJson());
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