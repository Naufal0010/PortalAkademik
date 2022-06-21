// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:portal_akademik/model/model.dart';
import '../../../../states/state_user_mahasiswa_profil_editable.dart';
import '../../../../widget/shimmer_widget.dart';

Widget provinsiEdit(
    BuildContext context, UserMahasiswaProfilEditableState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return ShimmerWidget(height: 10, width: 100);
  }

  if (state.data?.alamatMhsProv?.value == null) {
    return ShimmerWidget(height: 10, width: 100);
  }

  // return DropdownSearch<UserModelMahasiswa>(
  //   asyncItems: (String) async {
  //     var response = await Dio().get(
  //       (''),
  //     );
  //     var models = UserModelMahasiswa.fromJsonList(response.data);
  //     return models;
  //   },
  //   onChanged: (UserModelMahasiswa? data) {
  //     print(data);
  //   },
  // );

  return TextFormField(
    enabled: true,
    style: TextStyle(fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
    initialValue: state.data!.alamatMhsProv!.value,
  );
}
