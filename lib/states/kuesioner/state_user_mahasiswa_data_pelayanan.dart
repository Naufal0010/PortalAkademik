import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
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
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> postDataKuesionerPelayanan() async {
    final res =
        await NetworkRepository().tambahDataKuesionerPelayanan(tambahData!);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      UtilLogger.log('Post data kuesioner pelayanan', data);
    } else {
      notifyListeners();
    }
  }

  tambahDataBintang(
      String idKategori, String idSoal, int tipeSoal, int nilaiSoal) {
    tambahData!.jawabanKuisioner = tambahData!.jawabanKuisioner!.map((e) {
      if (e.idKategori == idKategori) {
        final check = e.kuisioner!
            .firstWhereOrNull((element) => element.idSoal == idSoal);

        if (check == null) {
          e.kuisioner!.add(DataKuesioner(
              idSoal: idSoal, tipeSoal: tipeSoal, nilaiSoal: nilaiSoal));
        } else {
          e.kuisioner = e.kuisioner!.map((e1) {
            if (e1.idSoal == idSoal) {
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
          nim: ApiLocalStorage.userModelMahasiswa!.nim, pendapat: '', jawabanKuisioner: []);
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
        }

        return e;
      }).toList();
    }
    UtilLogger.log('Tambah data opsi', tambahData!.toMap());
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
