import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';

import '../model/profil/model_user_agama.dart';
import '../model/profil/model_user_pembiayaan_kuliah.dart';
import '../model/profil/model_user_status_alamat_rumah.dart';
import '../model/profil/model_user_status_nikah.dart';

class UserMahasiswaState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswa? data;
  ModelUserAgama? dataAgama;
  ModelUserStatusNikah? dataStatusNikah;
  ModelUserStatusAlamatRumah? dataStatusAlamatRumah;
  ModelUserPembiayaanKuliah? dataPembiayaanKuliah;
  Map<String, dynamic>? error;
  String errorMessage = '';
  bool isLoading = true;

  UserMahasiswaState() {
    initData();
    initDataAgama();
    initDataStatusNikah();
    initDataStatusAlamatRumah();
    initDataPembiayaanKuliah();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getUser();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswa.fromMap(res.data);
      isLoading = false;
      ApiLocalStorage.userModelMahasiswa = data;
      notifyListeners();
    } else if (res.code == CODE.ERROR) {
      isLoading = false;
      errorMessage = res.message;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> initDataAgama() async {
    final resAgama = await NetworkRepository().getUserAgama();
    if (resAgama.code == CODE.SUCCESS) {
      dataAgama = ModelUserAgama.fromMap(resAgama.data);
      isLoading = false;
      notifyListeners();
    } else if (resAgama.code == CODE.ERROR) {
      isLoading = false;
      errorMessage = resAgama.message;
      notifyListeners();
    } else {
      isLoading = false;
      error = resAgama.message;
      notifyListeners();
    }
  }

  Future<void> initDataStatusNikah() async {
    final resStatusNikah = await NetworkRepository().getUserStatusNikah();
    if (resStatusNikah.code == CODE.SUCCESS) {
      dataStatusNikah = ModelUserStatusNikah.fromMap(resStatusNikah.data);
      isLoading = false;
      notifyListeners();
    } else if (resStatusNikah.code == CODE.ERROR) {
      isLoading = false;
      errorMessage = resStatusNikah.message;
      notifyListeners();
    } else {
      isLoading = false;
      error = resStatusNikah.message;
      notifyListeners();
    }
  }

  Future<void> initDataStatusAlamatRumah() async {
    final resStatusAlamatRumah =
        await NetworkRepository().getUserStatusAlamatRumah();
    if (resStatusAlamatRumah.code == CODE.SUCCESS) {
      dataStatusAlamatRumah =
          ModelUserStatusAlamatRumah.fromMap(resStatusAlamatRumah.data);
      isLoading = false;
      notifyListeners();
    } else if (resStatusAlamatRumah.code == CODE.ERROR) {
      isLoading = false;
      errorMessage = resStatusAlamatRumah.message;
      notifyListeners();
    } else {
      isLoading = false;
      error = resStatusAlamatRumah.message;
      notifyListeners();
    }
  }

  Future<void> initDataPembiayaanKuliah() async {
    final resPembiayaanKuliah =
    await NetworkRepository().getUserPembiayaanKuliah();
    if (resPembiayaanKuliah.code == CODE.SUCCESS) {
      dataPembiayaanKuliah =
          ModelUserPembiayaanKuliah.fromMap(resPembiayaanKuliah.data);
      isLoading = false;
      notifyListeners();
    } else if (resPembiayaanKuliah.code == CODE.ERROR) {
      isLoading = false;
      errorMessage = resPembiayaanKuliah.message;
      notifyListeners();
    } else {
      isLoading = false;
      error = resPembiayaanKuliah.message;
      notifyListeners();
    }
  }

  String getAgamaValue() {
    if (dataAgama == null) {
      return "";
    } else if (data == null) {
      return "";
    }
    return dataAgama!.rows!
        .where((element) => element.kode == data!.agmrId)
        .first
        .nama;
  }

  String getStatusNikahValue() {
    if (dataStatusNikah == null) {
      return "";
    } else if (data == null) {
      return "";
    }

    return dataStatusNikah!.rows!
        .where((element) => element.kode == data!.stnkrId)
        .first
        .nama;
  }

  String getStatusAlamatRumahValue() {
    if (dataStatusAlamatRumah == null) {
      return "";
    } else if (data == null) {
      return "";
    }

    return dataStatusAlamatRumah!.rows!
        .where((element) => element.kode == data!.statrumahId)
        .first
        .nama;
  }

  String getPembiayaanKuliahValue() {
    if (dataPembiayaanKuliah == null) {
      return "";
    } else if (data == null) {
      return "";
    }

    return dataPembiayaanKuliah!.rows!
        .where((element) => element.kode == data!.hubbiayaId)
        .first
        .nama;
  }

  Future<void> refreshData() async {
    error = null;
    errorMessage = '';
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