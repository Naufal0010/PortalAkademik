import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../model/kuesioner/evaluasidosen/model_evaluasi_dosen_tambah_data.dart';
import '../../model/kuesioner/model_user_mahasiswa_data_kelas_kuesioner.dart';

class UserMahasiswaDataKelasKuesionerState
    with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaDataKelasKuesioner? data;
  ModelEvaluasiDosenTambahData? evaluasiDosenTambahData;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaDataKelasKuesionerState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getDataKelasKuesioner();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaDataKelasKuesioner.fromMap(res.data);
      UtilLogger.log('Data Kelas Kuesioner', data?.toJson());
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> postDataKuesionerEvaluasiDosen() async {
    final res = await NetworkRepository()
        .tambahDataKuesionerEvaluasiDosen(evaluasiDosenTambahData!);
    if (res.code == CODE.SUCCESS) {
      refreshData();
      UtilLogger.log('Post data kuesioner pelayanan', data);
    } else {
      notifyListeners();
    }
  }

  tambahEvaluasiDosenBintang(String idSoal, String nipDosen, String bobot) {

    if (evaluasiDosenTambahData == null) {
      evaluasiDosenTambahData = new ModelEvaluasiDosenTambahData(klsId: '', nim: '', jawabanKuisioner: [], saran: []);
    }

    evaluasiDosenTambahData?.jawabanKuisioner!.add(EvaluasiJawabanKuisioner(
        idSoal: idSoal, bobot: bobot, nipDosen: nipDosen));

    evaluasiDosenTambahData?.jawabanKuisioner =
        evaluasiDosenTambahData!.jawabanKuisioner!.map((e) {
      if (e.idSoal == idSoal && e.nipDosen == nipDosen) {
        e.idSoal = idSoal;
        e.bobot = bobot;
        e.nipDosen = nipDosen;
      }

      return e;
    }).toList();
    UtilLogger.log('Tambah data opsi', evaluasiDosenTambahData!.toMap());

  }

  tambahEvaluasiDosenSaran(String nipDosen, String saran) {

    if (evaluasiDosenTambahData == null) {
      evaluasiDosenTambahData = new ModelEvaluasiDosenTambahData(klsId: '', nim: '', jawabanKuisioner: [], saran: []);
    }

    evaluasiDosenTambahData!.saran!
        .add(Saran(nipDosen: nipDosen, saranData: saran));

    evaluasiDosenTambahData!.saran = evaluasiDosenTambahData!.saran!.map((e) {
      if (e.nipDosen == nipDosen) {
        e.nipDosen = nipDosen;
        e.saranData = saran;
      }

      return e;
    }).toList();

    UtilLogger.log('Memasukan Saran', evaluasiDosenTambahData!.toMap());
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
