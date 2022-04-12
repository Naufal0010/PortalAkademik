import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/jadwal/model_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/model/presensi/model_user_mahasiswa_list_mk_presensi.dart';
import 'package:portal_akademik/util/service/logger.dart';

class UserMahasiswaListMkPresensiState with ChangeNotifier, DiagnosticableTreeMixin {
  MataKuliah? mataKuliah;
  UserMhsListMkPresensi? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData() async {
    final res = await NetworkRepository().getUserMahasiswaListMkPresensi(mataKuliah!.idKelas);
    if (res.code == CODE.SUCCESS) {
      data = UserMhsListMkPresensi.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Data Presensi Mata Kuliah Mahasiswa', data);
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> aksiPresensi(String presId) async {
    final res = await NetworkRepository().getAksiPresensiMahasiswa(presId);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      UtilLogger.log('Data Aksi Presensi Mata Kuliah Mahasiswa', data);
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