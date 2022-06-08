import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/krs/model_user_mahasiswa_krs_paket_semester.dart';

class UserMahasiswaKrsPaketSemesterState
    with ChangeNotifier, DiagnosticableTreeMixin {
  ModelUserMahasiswaKrsPaket? data;
  DataKrs? dataKrs;
  Map<String, dynamic>? error;
  bool isLoading = true;

  Future<void> initData(String paketId) async {
    final res =
        await NetworkRepository().getListMataKuliahPaketSemester(paketId);
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

  Future<void> postDataAmbilKelas(BuildContext context, String idKelas) async {
    final res = await NetworkRepository().doAmbilKelas(idKelas);
    UtilLogger.log('Post data ambil kelas', res);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      final snackBar = SnackBar(content: Text('Item dipilih'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      UtilLogger.log('Post data ambil kelas', data);
    } else if (res.code == CODE.VALIDATE) {
      final snackBar = SnackBar(
          content: Text(
              'Gagal menambahkan Rencana Studi. Batas Jumlah SKS yang boleh direncanakan semester ini maksimal'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    } else {
      final snackBar =
          SnackBar(content: Text('Terjadi kesalahan, silakan coba lagi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    error = null;
    data = null;
    isLoading = true;
    initData(ApiLocalStorage.idKelasPaketMataKuliah);
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
