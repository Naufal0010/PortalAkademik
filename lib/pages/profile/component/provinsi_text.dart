import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';

import '../../../../states/state_user_mahasiswa_profil_editable.dart';
import '../../../../widget/shimmer_widget.dart';

Widget provinsiText(
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

  return TextFormField(
    enabled: false,
    style: TextStyle(fontWeight: FontWeight.bold),
    decoration: InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
    initialValue: state.data!.alamatMhsProv!.value,
  );
}
