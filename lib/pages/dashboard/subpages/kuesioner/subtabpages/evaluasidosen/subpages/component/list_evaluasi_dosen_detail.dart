import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../../../../../../../states/kuesioner/state_user_mahasiswa_data_detail_kuesioner.dart';
import 'evaluasi_dosen_detail_list_tile.dart';

Widget ListEvaluasiDosenDetail(
    BuildContext context, UserMahasiswaDataDetailKuesionerState state) {

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

  UtilLogger.log("Error Message", "${state.errorMessage}");

  if (state.data?.kuesioner?.length == null) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 600,
      child: Html(
        data: """
               ${state.errorMessage}
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
    children: state.data!.kuesioner!
        .map(
          (e) => EvaluasiDosenDetailListTile(
            dataKuesioner: e,
            dosenKelas: state.data!.dosenKelas,
          ),
        )
        .toList(),
  );
}
