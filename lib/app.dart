import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/home_page.dart';
import 'package:portal_akademik/pages/login/login_page.dart';
import 'package:portal_akademik/states/jadwal/state_user_mahasiswa_jadwal_hari_ini.dart';
import 'package:portal_akademik/states/jadwal/state_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/states/jadwal/state_user_mahasiswa_jadwal_uas.dart';
import 'package:portal_akademik/states/khs/state_user_mahasiswa_khs.dart';
import 'package:portal_akademik/states/khs/state_user_mahasiswa_khs_semester.dart';
import 'package:portal_akademik/states/khs/state_user_mahasiswa_rekap_hasil_studi.dart';
import 'package:portal_akademik/states/krs/state_user_mahasiswa_krs.dart';
import 'package:portal_akademik/states/krs/state_user_mahasiswa_krs_header.dart';
import 'package:portal_akademik/states/kuesioner/state_user_mahasiswa_data_detail_kuesioner.dart';
import 'package:portal_akademik/states/kuesioner/state_user_mahasiswa_data_kelas_kuesioner.dart';
import 'package:portal_akademik/states/presensi/state_user_mahasiswa_list_mk_presensi.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_riwayat_registrasi.dart';
import 'package:portal_akademik/states/state_user_semester_aktif.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaKhsSemesterState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaJadwalHariIniState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaJadwalMataKuliahState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaJadwalUasState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaListMkPresensiState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaSemesterAktifState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaKrsState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaKrsHeaderState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaKhsState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaRekapHasilStudiState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaRiwayatRegistrasiState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaDataKelasKuesionerState()),
        ChangeNotifierProvider(create: (_) => UserMahasiswaDataDetailKuesionerState()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WillPopScope(
            child: Consumer<AuthState>(
              builder: (context, percentDone, child) {
                return context.watch<AuthState>().isLogged
                    ? HomePage()
                    : Login();
              },
            ),
            onWillPop: onWillPop,
          ),
          title: 'Portal Akademik',
          theme: ThemeData(fontFamily: 'Poppins'),
        ),
      ),
    );
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }
}
