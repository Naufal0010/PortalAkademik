import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/util/service/logger.dart';

var now = DateTime.now();
var weekDay = DateFormat('EEEE');
String formatDate = weekDay.format(now);

class UserMahasiswaJadwalHariIniState with ChangeNotifier, DiagnosticableTreeMixin {
  UserMhsJadwalMataKuliah? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  String weekDayToIndonesia(String weekDay) {
    String hari = '';

    switch(weekDay) {
      case 'Monday':
        hari = 'Senin';
        break;
      case 'Tuesday':
        hari = 'Selasa';
        break;
      case 'Wednesday':
        hari = 'Rabu';
        break;
      case 'Thursday':
        hari = 'Kamis';
        break;
      case 'Friday':
        hari = 'Jum\'at ';
        break;
      default:
        hari = 'Hari Libur';
        break;
    }

    return hari;
  }


  UserMahasiswaJadwalHariIniState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getJadwalListMataKuliahMahasiswa();
    if (res.code == CODE.SUCCESS) {
      data = UserMhsJadwalMataKuliah.fromMap(res.data);
      data!.data = data!.data!.where((element) => element.hariKuliah == weekDayToIndonesia(formatDate)).toList();
      isLoading = false;
      notifyListeners();
      UtilLogger.log('Jadwal Mata Kuliah Mahasiswa', data);
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