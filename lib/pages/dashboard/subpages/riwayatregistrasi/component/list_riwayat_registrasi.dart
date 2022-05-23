import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/pages/dashboard/subpages/riwayatregistrasi/component/riwayat_registrasi_list_tile.dart';
import 'package:portal_akademik/pages/empty_page.dart';

import '../../../../../states/state_user_mahasiswa_riwayat_registrasi.dart';
import '../../../../../util/color_pallete.dart';

Widget getListRiwayatRegistrasi(
    BuildContext context, UserMahasiswaRiwayatRegistrasiState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          state.refreshData();
        },
        child: Text('Refresh'),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  if (state.data?.data?.length == null) {
    return EmptyPage(text: 'KRS');
  }

  return Expanded(
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.data?.data?.length,
      itemBuilder: (context, index) {
        return RiwayatRegistrasiListTile(state.data!.data![index]);
      },
    ),
  );
}
