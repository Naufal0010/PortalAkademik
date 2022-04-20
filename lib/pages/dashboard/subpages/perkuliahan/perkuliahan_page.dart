import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_detail_tile.dart';

import '../../../../states/jadwal/state_user_mahasiswa_jadwal_filter.dart';
import '../../../../states/state.dart';
import 'component/link_kalender.dart';
import 'component/list_jadwal.dart';

class PerkuliahanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: LinkKalender()
            ),
            Consumer<UserMahasiswaJadwalFilterState>(
              builder: (context, value, child) {
                return value.isLoading
                    ? ShimmerListDetailTile()
                    : ListJadwalKuliah(context, value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
