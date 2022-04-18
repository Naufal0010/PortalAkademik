import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/jadwal/component/list_jadwal.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_detail_tile.dart';

import '../../../../states/jadwal/state_user_mahasiswa_jadwal_filter.dart';
import '../../../../states/state.dart';
import '../../../../widget/label_sub_header_widget.dart';
import 'component/link_header.dart';
import 'component/link_kalender.dart';

class JadwalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Jadwal',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LinkHeader('Semua', true),
                    LinkHeader('Kuliah', false),
                    LinkHeader('Ujian', false),
                  ],
                )),
            LabelSubHeader('Kuliah', 20),
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
