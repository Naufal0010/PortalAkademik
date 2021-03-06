import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/profile/component/biodata_diri.dart';
import 'package:portal_akademik/pages/profile/component/biodata_header.dart';
import 'package:portal_akademik/pages/profile/component/biodata_orangTua.dart';
import 'package:portal_akademik/pages/profile/component/biodata_riwayatPendidikan.dart';
import 'package:portal_akademik/pages/profile/subpages/biodataEdit_page.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
// import 'package:provider/provider.dart';

class BiodataMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaState userMahasiswa =
        Provider.of<UserMahasiswaState>(context, listen: false);

    UserMahasiswaProfilEditableState userMahasiswaProfil =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: false);

    Future<void> refresh() {
      userMahasiswa.refreshData();
      userMahasiswaProfil.refreshData();
      return userMahasiswaProfil.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
          title: Text('Biodata',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis),
          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => BiodataEditPage()));
          //       },
          //       icon: const Icon(Icons.edit)),
          // ],
          backgroundColor: Colors.white,
          // foregroundColor: const Color(0xff4848),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BiodataHeaderProfile(),
                  LabelSubHeader('Biodata Pribadi', 20),
                  Consumer<UserMahasiswaState>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? ShimmerWidget(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                            )
                          : BiodataDiriProfile();
                    },
                  ),
                  LabelSubHeader('Riwayat Pendidikan Terakhir', 20),
                  Consumer<UserMahasiswaProfilEditableState>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? ShimmerWidget(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                            )
                          : RiwayatPendidikanProfile();
                    },
                  ),
                  LabelSubHeader('Biodata Orang Tua/Wali', 20),
                  Consumer<UserMahasiswaProfilEditableState>(
                    builder: (context, value, child) {
                      return value.isLoading
                          ? ShimmerWidget(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                            )
                          : BiodataOrangTuaProfile();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
