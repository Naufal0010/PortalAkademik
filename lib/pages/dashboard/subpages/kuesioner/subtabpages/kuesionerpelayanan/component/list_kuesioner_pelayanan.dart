import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../../../../states/kuesioner/state_user_mahasiswa_data_pelayanan.dart';
import 'kuesioner_pelayanan_list_tile.dart';

Widget ListKuesionerPelayananan(
    BuildContext context, UserMahasiswaDataPelayananState state) {

  if (state.data?.data == null) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Html(
        data: """
               ${state.error}
              """,
        style: {
          "body": Style(
            fontFamily: 'Poppins',
            textAlign: TextAlign.center,
            fontSize: FontSize(16.0),
          ),
        },
      ),
    );
  }

  return Column(
    children: state.data!.data!.map((e) {
      state.tambahDataOpsi(e.kategori!.kategoriId!.toString(), 1);
      return KuesionerPelayananListTile(
        dataKuesionerPelayanan: e,
      );
    }).toList(),
  );
}
