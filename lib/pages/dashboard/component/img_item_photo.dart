import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../states/state_user_mahasiswa.dart';

Widget getPhoto(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  if (state.data?.foto == null) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  return CircleAvatar(
    radius: 25,
    backgroundColor: Colors.grey,
    foregroundColor: Colors.grey,
    backgroundImage:
    NetworkImage('https://portal.ulm.ac.id/uploads/${state.data?.foto}'),
  );
}