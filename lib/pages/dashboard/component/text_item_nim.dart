import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../states/state_user_mahasiswa.dart';

Widget getNimProdiJenjang(BuildContext context, UserMahasiswaState state) {
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

  if (state.data?.nim == null) {
    return Text(
      'Loading',
      style: TextStyle(color: Colors.white, fontSize: 16),
    );
  }

  return Text(
    '${state.data?.nim} - ${state.data?.prodi?.jenjang} ${state.data?.prodi?.nama}',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0xffFFE8D1),
    ),
  );
}