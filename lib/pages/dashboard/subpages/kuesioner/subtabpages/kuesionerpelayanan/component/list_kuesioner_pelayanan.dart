import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

import '../../../../../../../states/kuesioner/state_user_mahasiswa_data_pelayanan.dart';
import '../../../../../../../util/api_local_store.dart';
import '../../../../../../../util/color_pallete.dart';
import 'kuesioner_pelayanan_list_tile.dart';

Widget ListKuesionerPelayananan(
    BuildContext context, UserMahasiswaDataPelayananState state) {

  final tfPelayanan = TextEditingController();
  final tfPerbaikan = TextEditingController();

  SimpleFontelicoProgressDialog _dialog =
  SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

  void postData() async {
    _dialog.show(
        message: 'Loading...',
        type: SimpleFontelicoProgressDialogType.normal,
        indicatorColor: ColorPallete.primary);
    await Future.delayed(Duration(seconds: 1));
    state.postDataKuesionerPelayanan(context);
    state.refreshData();
    _dialog.hide();
  }

  if (state.data?.data == null) {
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
    children: [
      Column(
        children: state.data!.data!.map((e) {
          if (e.kategori!.kategoriId == null) {
            state.tambahDataOpsi(e.kategori!.kategoriId!.toString(), 1);
          }
          return KuesionerPelayananListTile(
            dataKuesionerPelayanan: e,
          );
        }).toList(),
      ),
      SizedBox(
        height: 8,
      ),
      SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Kolom pendapat anda tentang pelayanan beasiswa/kesehatan/softskills/minat dan penalaran',
            style: TextStyle(fontSize: 16),
          )),
      Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1, color: ColorPallete.primary),
          color: Colors.white,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: TextField(
            controller: tfPelayanan,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText:
                'Deskripsikan pendapat anda tentang pelayanan mahasiswa'),
            onChanged: (text) {
              state.tambahDataSaranPendapat(ApiLocalStorage.userModelMahasiswa!.nim, text);
            },
          ),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text(
          'Kolom upaya perbaikan tentang pelayanan beasiswa/kesehatan/softskills/minat dan penalaran',
          style: TextStyle(fontSize: 16),
        ),
      ),
      Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(width: 1, color: ColorPallete.primary),
          color: Colors.white,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: TextField(
            controller: tfPerbaikan,
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                hintText:
                'Deskripsikan pendapat anda tentang perbaikan pelayanan mahasiswa'),
            onChanged: (text) {
              state.tambahDataSaranPerbaikan(ApiLocalStorage.userModelMahasiswa!.nim, text);
            },
          ),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            postData();
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Text(
            'Simpan',
            style: TextStyle(fontSize: 16),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.deepPurpleAccent,
              onPrimary: Colors.white),
        ),
      ),
    ],
  );
}
