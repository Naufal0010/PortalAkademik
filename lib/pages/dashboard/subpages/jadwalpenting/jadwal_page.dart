import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_tile.dart';

import '../../../../states/jadwal/state_user_mahasiswa_jadwal_penting.dart';
import '../../../../states/state.dart';
import 'component/jadwal_penting_list_table.dart';

class JadwalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaJadwalPentingState jadwalPenting =
    Provider.of<UserMahasiswaJadwalPentingState>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Jadwal Penting',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: jadwalPenting.isLoading
            ? ShimmerListTile()
            : JadwalPentingListTable(),
      ),
    );
  }
}
