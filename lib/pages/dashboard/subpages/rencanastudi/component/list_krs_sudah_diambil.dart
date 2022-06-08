import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../states/krs/state_user_mahasiswa_krs.dart';
import '../../../../../states/krs/state_user_mahasiswa_krs_header.dart';
import '../../../../../util/color_pallete.dart';
import 'empty_rencanastudi.dart';
import 'krs_list_sudah_ambil.dart';

Widget ListKrsSudahDiambil(
    BuildContext context, UserMahasiswaKrsHeaderState stateHeader, UserMahasiswaKrsState stateKrs) {
  if (stateHeader.error != null) {
    Fluttertoast.showToast(
        msg: "${stateHeader.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          stateHeader.refreshData();
        },
        child: Center(child: Text('Refresh')),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  if (stateKrs.data?.mkReguler?.krsListMk?.length == 0) {
    return Container(
        width: MediaQuery.of(context).size.width, height: 500, child: EmptyRencanaStudi());
  }

  if (stateKrs.data == null) {
    return Container();
  }

  return Column(
    children: stateKrs.data!.mkReguler!.krsListMk!
        .map(
          (e) => KrsListSudahAmbil(data: e, dataKrs: stateHeader.data!.krs!),
    )
        .toList(),
  );
}