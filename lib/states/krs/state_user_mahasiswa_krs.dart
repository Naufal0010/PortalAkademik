import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
    final res = await NetworkRepository().getListKrsMahasiswa(
        ApiLocalStorage.semesterAktif!.rows![0].semesterAktif);
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

  Future<void> postDataBatalkanKrs(BuildContext context, String idKelas) async {
    final res = await NetworkRepository().doBatalkanKrs(idKelas);
    UtilLogger.log('Post data batalkan KRS', res);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      final snackBar = SnackBar(content: Text('Item berhasil dihapus'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      UtilLogger.log('Post data batalkan', data);
    } else {
      final snackBar =
          SnackBar(content: Text('Terjadi kesalahan, silakan coba lagi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  Future<void> postDataAjukanKrs(BuildContext context) async {
    final res = await NetworkRepository().doAjukanDosenPA();
    UtilLogger.log('Post data Ajukan KRS', res);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      final snackBar = SnackBar(
          content: Text(
              'KRS berhasil diajukan. Silakan tunggu hasil koreksi rencana studi dari dosen PA anda.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      UtilLogger.log('Post data Ajukan KRS', data);
    } else {
      final snackBar =
          SnackBar(content: Text('Terjadi kesalahan, silakan coba lagi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  Future<void> postDataRevisiKrs(BuildContext context) async {
    final res = await NetworkRepository().doRevisiKRS();
    UtilLogger.log('Post data Revisi KRS', res);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      final snackBar = SnackBar(content: Text('KRS berhasil direvisi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      UtilLogger.log('Post data Ajukan KRS', data);
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
    notifyListeners();
    initData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
