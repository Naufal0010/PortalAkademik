import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../../states/kuesioner/state_user_mahasiswa_data_pelayanan.dart';
import 'kuesioner_pelayanan_list_tile.dart';

Widget ListKuesionerPelayananan(
    BuildContext context, UserMahasiswaDataPelayananState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  if (state.data?.data == 0) {
    return Center(
      child: Text(
        'Belum masuk masa pengisian kuesioner',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  return Column(
    children: state.data!.data!
        .map(
          (e) => KuesionerPelayananListTile(
            dataKategori: e.kategori!,
      ),
    )
        .toList(),
  );
}

