import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:portal_akademik/config/config.dart';
import 'package:portal_akademik/model/model_api.dart';
import 'package:portal_akademik/util/api/consumer.dart';
import 'package:portal_akademik/util/service/util_preference.dart';

/*
*
* Class NetworkRepository berfungsi untuk menampung function yang bertujuan
* mengambil dari API
*
* */

class NetworkRepository {
  String? username = UtilPreferences.getString('username');

  static ApiConsumer consumer = ApiConsumer(
      apiUrl: !kDebugMode
          ? 'http://api-siapps.gov.id/api'
          : 'https://git.ulm.ac.id/api-siapps/public/api',
      appId: 'PortalAkademik',
      apiKey: '94c3e52e40117282cb7b4b1d9450701d',
      apiTimeout: 20);

  // getUserEditable() untuk mengambil data mahasiswa yang bisa di-edit atau diubah
  Future<ApiModel> getUserEditable() async {
    return await consumer.execute(url: '/akademik/mahasiswa/profil/$username');
  }

  // getUser() untuk mengambil data mahasiswa dengan program studi dari API
  Future<ApiModel> getUser() async {
    return await consumer.execute(url: '/mahasiswa/$username?with[]=prodi');
  }

  // getTranskripHasilStudiMahasiswa(jenjang, angkatan) untuk mengambil data
  // transkrip hasil data mahasiswa
  Future<ApiModel> getTranskripHasilStudiMahasiswa(
      String jenjang, String angkatan) async {
    return await consumer.execute(
        url: '/akademik/transkrip/mahasiswa/$username/$jenjang/$angkatan');
  }

  // getUserMahasiswaKhsSemester() untuk mengambil data KHS semester mahasiswa
  Future<ApiModel> getUserMahasiswaKhsSemester() async {
    return await consumer.execute(
        url: '/akademik/khs/riwayatSemester/$username');
  }

  // getKhsPerSemesterMahasiswa(semId, kodeProdi, jenjang, angkatan) untuk
  // mengambil data KHS per Semester Mahasiswa
  Future<ApiModel> getKhsPerSemesterMahasiswa(
      String semId, String kodeProdi, String jenjang, String angkatan) async {
    return await consumer.execute(
        url:
            '/akademik/khs/perSemester/$username/$semId/$kodeProdi/$jenjang/$angkatan');
  }

  // getJadwalListMataKuliahMahasiswa() untuk mengambil list data mata
  // kuliah mahasiswa
  Future<ApiModel> getJadwalListMataKuliahMahasiswa() async {
    return await consumer.execute(
        url: '/akademik/jadwal/mahasiswa/kuliah/$username');
  }

  // getUserMahasiswaListMkPresensi() untuk mengambil list presensi mahasiswa
  // berdasarkan parameter kelasId per mata kuliah
  Future<ApiModel> getUserMahasiswaListMkPresensi(String kelasId) async {
    return await consumer.execute(
        url: '/akademik/presensiKelas/mahasiswa/$kelasId/$username');
  }

  // getAksiPresensiMahasiswa(presId) untuk melakukan aksi klik
  // atau tap pada tombol presensi
  Future<ApiModel> getAksiPresensiMahasiswa(String presId) async {
    return await consumer.execute(
        url:
            '/akademik/presensiKelasDetil/deleteAbsen?presId[eq]=$presId&mhsNim[eq]=$username',
        method: MethodRequest.DELETE);
  }

  // getHeaderKrsMahasiswa() untuk mengambil data KRS Mahasiswa
  Future<ApiModel> getHeaderKrsMahasiswa() async {
    return await consumer.execute(url: '/akademik/krs/header/mahasiswa');
  }

  // getRiwayatRegistrasiMahasiswa() untuk mengambil data Riwayat Registrasi
  // mahasiswa
  Future<ApiModel> getRiwayatRegistrasiMahasiswa() async {
    return await consumer.execute(
        url: '/akademik/statusBayar/riwayatRegistrasi/$username');
  }

  // refreshToken() jika access token expired
  Future refreshToken() async {
    FormData formData = FormData.fromMap({
      "tokenRefresh": UtilPreferences.getString(Preferences.refreshToken),
    });

    final response = await consumer.execute(
        url: '/auth/refresh', formData: formData, method: MethodRequest.PUT);

    if (response.code == CODE.SUCCESS) {
      return response.data['accessToken'];
    } else {
      return null;
    }
  }

  // auth() untuk mengautensikasi user jika ingin login menggunakan username dan password
  Future auth(String? username, String? password) async {
    return await consumer.auth(username: username, password: password);
  }
}
