import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../states/state_user_mahasiswa.dart';

Widget getName(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Text('Loading');
  }

  if (state.data?.nama == null) {
    return Text(
      'Loading',
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  return Text(
    '${state.data?.nama}',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}
