import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../states/jadwal/state_user_mahasiswa_jadwal_filter.dart';
import '../../../../../util/color_pallete.dart';
import 'jadwal_item.dart';

Widget ListJadwalKuliah(
    BuildContext context, UserMahasiswaJadwalFilterState state) {
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

  if (state.dataFilter?.data?.length == 0) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            'Tidak ada Jadwal Kuliah'
          ),
        ),
      ),
    );
  }

  return Column(
    children: state.dataFilter!.data!
        .map(
          (e) => JadwalListItem(e),
    ).toList(),
  );
}