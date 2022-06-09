import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/dashboard/subpages/ujianakhir/component/ujianakhir_list_table.dart';
import 'package:portal_akademik/states/jadwal/state_user_mahasiswa_jadwal_uas.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';

class UjianAkhirPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserMahasiswaJadwalUasState userUas =
        Provider.of<UserMahasiswaJadwalUasState>(context, listen: true);

    Future<void> refresh() {
      return userUas.refreshData();
    }

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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: userUas.isLoading
                ? ShimmerWidget(width: MediaQuery.of(context).size.width, height: 40,)
                : UjianAkhirListTable(),
          ),
        ),
      ),
    );
  }
}
