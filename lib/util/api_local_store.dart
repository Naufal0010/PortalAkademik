import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_semester_aktif.dart';

class ApiLocalStorage {
  static UserModelMahasiswa? userModelMahasiswa;
  static UserModelSemesterAktif? semesterAktif;
  static String kelasId = '';
  static String idKelasPaketMataKuliah = '';
  static UserModelMahasiswaEditable? UserMahasiswaProfilEditable;
}
