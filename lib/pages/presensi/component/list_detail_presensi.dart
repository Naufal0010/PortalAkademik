import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/pages/empty_page.dart';
import 'package:portal_akademik/pages/presensi/component/presensi_list_detail_tile.dart';

import '../../../states/presensi/state_user_mahasiswa_list_mk_presensi.dart';
import '../../../util/color_pallete.dart';

Widget getListDetailPresensi(
    BuildContext context, UserMahasiswaListMkPresensiState state) {
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

  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "Session Habis",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  if (state.data?.data?.length == null) {
    return EmptyPage(text: 'Mata Kuliah');
  }

  return Column(
    children: state.data!.data!
        .map(
          (e) => PresensiListDetailTile(
            data: e,
            onTap: () {
              state.aksiPresensi(e.kodePertemuan);
            },
          ),
        )
        .toList(),
  );
}
