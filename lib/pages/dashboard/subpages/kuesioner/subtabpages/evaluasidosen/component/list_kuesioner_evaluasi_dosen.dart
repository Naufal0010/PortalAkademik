import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../../../../states/kuesioner/state_user_mahasiswa_data_kelas_kuesioner.dart';
import '../../../../../../../states/state.dart';
import '../../../../../../../util/api_local_store.dart';
import '../../../../../../../util/color_pallete.dart';
import '../../../../../../../util/service/logger.dart';
import '../subpages/evaluasi_dosen_detail_page.dart';
import 'empty_evaluasi_dosen.dart';
import 'evaluasi_dosen_list_tile.dart';

Widget getListKuesionerEvaluasiDosen(
    BuildContext context, UserMahasiswaDataKelasKuesionerState state) {
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

  if (state.data?.kelas?.length == 0) {
    return EmptyEvaluasiDosen();
  }

  return ListView.builder(
    physics: AlwaysScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: state.data?.kelas?.length,
    itemBuilder: (context, index) {
      return EvaluasiDosenListTile(
          data: state.data!.kelas![index],
          onTap: () {
            UserMahasiswaDataKelasKuesionerState user =
                Provider.of<UserMahasiswaDataKelasKuesionerState>(context,
                    listen: false);
            user.kelasId = state.data!.kelas![index].klsId;
            ApiLocalStorage.kelasId = state.data!.kelas![index].klsId;
            UtilLogger.log('KelasId', state.data!.kelas![index].klsId);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    EvaluasiDosenDetailPage(state.data!.kelas![index])));
          });
    },
  );
}
