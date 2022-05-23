import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/pages/empty_page.dart';
import 'package:portal_akademik/pages/presensi/component/presensi_list_tile.dart';

import '../../../states/jadwal/state_user_mahasiswa_jadwal_matakuliah.dart';
import '../../../util/color_pallete.dart';
import '../presensi_detail_page.dart';
import 'list_color_presensi.dart';

Widget getListPresensi(
    BuildContext context, UserMahasiswaJadwalMataKuliahState state) {
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
    return EmptyPage(text: 'Mata Kuliah',);
  }

  return Expanded(
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.data?.data?.length,
      itemBuilder: (context, index) {
        return PresensiListTile(
          color:
              ListColorPresensi.colors[index % ListColorPresensi.colors.length],
          data: state.data!.data![index],
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    PresensiDetailPage(state.data!.data![index])));
          },
        );
      },
    ),
  );
}
