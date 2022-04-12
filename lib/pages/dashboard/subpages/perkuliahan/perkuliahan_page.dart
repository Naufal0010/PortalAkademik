import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/perkuliahan/component/jadwal_perkuliahan_list_table.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_tile.dart';

import '../../../../states/jadwal/state_user_mahasiswa_jadwal_matakuliah.dart';
import '../../../../states/state.dart';

class PerkuliahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaJadwalMataKuliahState userJadwal =
        Provider.of<UserMahasiswaJadwalMataKuliahState>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Perkuliahan',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: userJadwal.isLoading
            ? ShimmerListTile()
            : JadwalPerkuliahanListTable(),
      ),
    );
  }
}
