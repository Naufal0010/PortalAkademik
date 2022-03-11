import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/states/state.dart';

Widget getErrorName(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );

    return Text('Loading');
  }

  return Text(
    '${state.data!.nama}',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Widget getErrorNim(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );

    return Text('Loading');
  }

  return Text(
    '${state.data!.nim} - ${state.data!.prodi!.jenjang} ${state.data!.prodi!.nama}',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0xffFFE8D1),
    ),
  );
}

Widget getErrorPhoto(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );

    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  return CircleAvatar(
    radius: 25,
    backgroundImage: NetworkImage('https://portal.ulm.ac.id/uploads/${state.data!.foto}'),
  );
}