import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/kuesioner/model_user_mahasiswa_data_pelayanan.dart';
import '../../model/kuesioner/pelayanan/model_pelayanan_ulm_tambah_data.dart';

class UserMahasiswaDataPelayananState
    with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaDataKuesionerPelayanan? data;
  ModelPelayananUlmTambahData? tambahData;
  Map<String, dynamic>? error;
  String errorMessage = '';
  bool isLoading = true;

  UserMahasiswaDataPelayananState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getDataKuesionerPelayanan();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaDataKuesionerPelayanan.fromMap(res.data);
      UtilLogger.log('Data Kuesioner Pelayanan', data?.toJson());
      isLoading = false;
      notifyListeners();
    } else if (res.code == CODE.ERROR) {
      isLoading = false;
      error = res.message;
      notifyListeners();
    } else {
      isLoading = false;
      errorMessage = res.message;
      notifyListeners();
    }
  }

  Future<void> postDataKuesionerPelayanan(BuildContext context) async {
    final res =
        await NetworkRepository().tambahDataKuesionerPelayanan(tambahData!);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      UtilLogger.log('Post data kuesioner pelayanan', data);
    } else {
      final snackBar = SnackBar(
          content: Text('Item masih ada yang belum diisi, silakan lengkapi'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  tambahDataBintang(
      String idKategori, String idSoal, int tipeSoal, int nilaiSoal) {
    tambahData!.jawabanKuisioner = tambahData!.jawabanKuisioner!.map((e) {
      if (e.idKategori == idKategori) {
        final check = e.kuisioner!.firstWhereOrNull((element) =>
            element.idSoal == idSoal && element.tipeSoal == tipeSoal);

        if (check == null) {
          e.kuisioner!.add(DataKuesioner(
              idSoal: idSoal, tipeSoal: tipeSoal, nilaiSoal: nilaiSoal));
        } else {
          e.kuisioner = e.kuisioner!.map((e1) {
            if (e1.idSoal == idSoal && e1.tipeSoal == tipeSoal) {
              e1.idSoal = idSoal;
              e1.nilaiSoal = nilaiSoal;
              e1.tipeSoal = tipeSoal;
            }

            return e1;
          }).toList();
        }
      }
      return e;
    }).toList();
    UtilLogger.log('Tambah data bintang', tambahData!.toMap());
  }

  tambahDataOpsi(String idKategori, int nilaiKategori) {
    if (tambahData == null) {
      tambahData = new ModelPelayananUlmTambahData(
          nim: ApiLocalStorage.userModelMahasiswa!.nim,
          pendapat: '',
          perbaikan: '',
          jawabanKuisioner: []);
    }
    final check = tambahData!.jawabanKuisioner!
        .firstWhereOrNull((element) => element.idKategori == idKategori);

    if (check == null) {
      tambahData!.jawabanKuisioner!.add(JawabanKuisioner(
          nilaiKategori: nilaiKategori, idKategori: idKategori, kuisioner: []));
    } else {
      tambahData!.jawabanKuisioner = tambahData!.jawabanKuisioner!.map((e) {
        if (e.idKategori == idKategori) {
          e.idKategori = idKategori;
          e.nilaiKategori = nilaiKategori;
          UtilLogger.log('Check Data Update', e.toMap());
        }

        return e;
      }).toList();
    }
    UtilLogger.log('Tambah data opsi', tambahData!.toMap());
  }

  tambahDataSaranPendapat(String nim, String pendapat) {
    if (tambahData == null) {
      tambahData = new ModelPelayananUlmTambahData(
          nim: ApiLocalStorage.userModelMahasiswa!.nim,
          pendapat: '',
          perbaikan: '',
          jawabanKuisioner: []);
    }

    tambahData!.pendapat = pendapat;

    if (tambahData!.nim == nim) {
      tambahData!.nim = nim;
      tambahData!.pendapat = pendapat;
    }

    UtilLogger.log('Saran pendapat', tambahData!.toMap());
  }

  tambahDataSaranPerbaikan(String nim, String perbaikan) {
    if (tambahData == null) {
      tambahData = new ModelPelayananUlmTambahData(
          nim: ApiLocalStorage.userModelMahasiswa!.nim,
          pendapat: '',
          perbaikan: '',
          jawabanKuisioner: []);
    }

    tambahData!.perbaikan = perbaikan;

    if (tambahData!.nim == nim) {
      tambahData!.nim = nim;
      tambahData!.perbaikan = perbaikan;
    }

    UtilLogger.log('Saran perbaikan', tambahData!.toMap());
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
