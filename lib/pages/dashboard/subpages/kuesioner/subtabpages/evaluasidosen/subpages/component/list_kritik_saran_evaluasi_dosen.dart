import 'package:flutter/material.dart';
import 'package:portal_akademik/util/service/logger.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../../../../../../states/kuesioner/state_user_mahasiswa_data_detail_kuesioner.dart';
import '../../../../../../../../states/kuesioner/state_user_mahasiswa_data_kelas_kuesioner.dart';
import '../../../../../../../../states/state.dart';
import '../../../../../../../../util/color_pallete.dart';
import 'evaluasi_dosen_kritik_saran_list.dart';

Widget ListKritikSaranEvaluasiDosen(
    BuildContext context, UserMahasiswaDataDetailKuesionerState state) {
  if (state.data?.dosenKelas?.length == null) {
    return Container();
  }

  SimpleFontelicoProgressDialog _dialog =
      SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

  void postData() async {
    UserMahasiswaDataKelasKuesionerState user =
        Provider.of<UserMahasiswaDataKelasKuesionerState>(context,
            listen: false);
    _dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        indicatorColor: ColorPallete.primary);
    await Future.delayed(Duration(seconds: 1));
    user.postDataKuesionerEvaluasiDosen(context);
    user.refreshData();
    _dialog.hide();
  }

  UtilLogger.log(
      'Kritik saran', state.data!.dosenKelas!.map((e) => e.dosen!.toJson()));
  return Column(
    children: [
      Column(
        children: state.data!.dosenKelas!
            .map(
              (e) => EvaluasiDosenKritikSaranList(
                dataDosen: e.dosen!,
                dosenKelas: e,
              ),
            )
            .toList(),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            postData();
          },
          child: Text(
            'Simpan',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent, onPrimary: Colors.white),
        ),
      ),
    ],
  );
}
