import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/jadwal/model_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

class UserMahasiswaJadwalFilterState
    with ChangeNotifier, DiagnosticableTreeMixin {
  UserMhsJadwalMataKuliah? data;
  UserMhsJadwalMataKuliah? dataFilter;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaJadwalFilterState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getJadwalListMataKuliahMahasiswa();
    if (res.code == CODE.SUCCESS) {
      data = UserMhsJadwalMataKuliah.fromMap(res.data);
      dataFilter = UserMhsJadwalMataKuliah.fromMap(res.data);
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Jadwal Mata Kuliah Mahasiswa', data);
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> initDataFilter(String hari) async {
    dataFilter!.data =
        data!.data!.where((element) => element.hariKuliah == hari).toList();
    notifyListeners();
    UtilLogger.log('Jadwal Mata Kuliah filter', data);
    isLoading = false;
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
