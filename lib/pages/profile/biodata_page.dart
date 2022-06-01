import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/profile/component/biodata_diri.dart';
import 'package:portal_akademik/pages/profile/component/biodata_header.dart';
import 'package:portal_akademik/pages/profile/component/biodata_orangTua.dart';
import 'package:portal_akademik/pages/profile/component/biodata_riwayatPendidikan.dart';
import 'package:portal_akademik/pages/profile/subpages/biodata_edit.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
// import 'package:portal_akademik/pages/profile/component/biodata_menu.dart';
import 'package:provider/provider.dart';
import 'package:portal_akademik/states/state.dart';

// import '../../../../util/color_pallete.dart';

class BiodataMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaProfilEditableState userMahasiswaProfil =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);

    Future<void> refresh() {
      userMahasiswaProfil.refreshData();
      return userMahasiswaProfil.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
          ],
          // leading: const Icon(Icons.settings),

          // actions: [
          //   IconButton(
          //       onPressed: () {
          //         Navigator.of(context).push(MaterialPageRoute(
          //             builder: (context) => BiodataEditProfile()));
          //       },
          //       icon: const Icon(Icons.edit))
          // ],
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xff4848),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: false),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BiodataHeaderProfile(),
                  LabelSubHeader('Biodata Pribadi', 20),
                  BiodataDiriProfile(),
                  LabelSubHeader('Riwayat Pendidikan Terakhir', 20),
                  RiwayatPendidikanProfile(),
                  LabelSubHeader('Biodata Orang Tua/Wali', 20),
                  BiodataOrangTuaProfile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
