import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';

Widget getName(BuildContext context, UserMahasiswaProfilEditableState state) {
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

  return Text(
    '${state.data!.nama}',
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Widget getNim(BuildContext context, UserMahasiswaProfilEditableState state) {
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

  return Text(
    'Nim. ${state.data!.nim}',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0xffFFE8D1),
    ),
  );
}

Widget getProdi(BuildContext context, UserMahasiswaProfilEditableState state) {
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

  return Text(
    'Prodi. ${state.data!.prodi!.nama}\n ${state.data!.angkatan}',
    textAlign: TextAlign.center,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0xffFFE8D1),
    ),
  );
}

Widget getPhoto(BuildContext context, UserMahasiswaProfilEditableState state) {
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

  return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox.fromSize(
        size: Size.fromRadius(32),
        child: Image.network(
          'https://portal.ulm.ac.id/uploads/${state.data!.foto}',
          fit: BoxFit.cover,
        ),
      ));
}
