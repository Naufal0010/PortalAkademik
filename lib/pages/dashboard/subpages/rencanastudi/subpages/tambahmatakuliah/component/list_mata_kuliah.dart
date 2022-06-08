import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/pages/dashboard/subpages/rencanastudi/subpages/tambahmatakuliah/component/empty_matakuliah.dart';

import '../../../../../../../states/krs/state_user_mahasiswa_krs_paket_semester.dart';
import '../../../../../../../util/color_pallete.dart';
import 'mata_kuliah_component.dart';

Widget ListMataKuliahPaket(
    BuildContext context, UserMahasiswaKrsPaketSemesterState state) {
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
        child: Center(child: Text('Refresh')),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  if (state.data?.data?.length == 0) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: EmptyMataKuliah());
  }

  return Column(
    children: state.data!.data!
        .map(
          (e) => MataKuliahComponent(
            data: e,
            onPressed: () {
              state.postDataAmbilKelas(context, e.idKls);
            },
          ),
        )
        .toList(),
  );
}
