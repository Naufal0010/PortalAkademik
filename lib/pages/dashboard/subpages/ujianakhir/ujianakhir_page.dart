import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/ujianakhir/component/ujianakhir_list_table.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_tile.dart';
import 'package:portal_akademik/states/jadwal/state_user_mahasiswa_jadwal_uas.dart';
import 'package:portal_akademik/states/state.dart';

class UjianAkhirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaJadwalUasState userUas =
        Provider.of<UserMahasiswaJadwalUasState>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Ujian Akhir',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: userUas.isLoading
            ? ShimmerListTile()
            : UjianAkhirListTable(),
      ),
    );
  }
}
