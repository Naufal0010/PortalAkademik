import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../../../util/color_pallete.dart';
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(width: 1, color: ColorPallete.primary),
        // color: Colors.amber,
      ),
      child: Center(
        child: Text(
          'Tidak ada jadwal mata kuliah hari ini',
          style: TextStyle(color: Colors.black),
        ),
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

