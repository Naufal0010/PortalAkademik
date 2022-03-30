import 'package:flutter/material.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_riwayat_registrasi.dart';
import 'package:portal_akademik/widget/error_handling_widget.dart';
import '../../../../states/state.dart';
import '../../../presensi/component/shimmer_list_tile.dart';

class RiwayatRegistrasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    UserMahasiswaRiwayatRegistrasiState user =
    Provider.of<UserMahasiswaRiwayatRegistrasiState>(context, listen: true);

    Future<void> refresh() {
      user.refreshData();
      return user.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Riwayat Registrasi',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                user.isLoading
                    ? ShimmerListTile()
                    : getErrorListRiwayatRegistrasi(context, user),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
