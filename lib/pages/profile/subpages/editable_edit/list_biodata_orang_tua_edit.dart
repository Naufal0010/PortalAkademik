import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';

import '../../../../states/state_user_mahasiswa_profil_editable.dart';

Widget listBiodataOrangTuaEdit(
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

    return ShimmerWidget(height: 200, width: MediaQuery.of(context).size.width);
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Nama Ayah',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ayahNama!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Status Ayah',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ayahKematian!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Nomor Induk Kependudukan (NIK)',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ayahNik!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Pekerjaan Ayah',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ayahPekerjaan!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Nama Ibu',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ibuNama!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Status Ibu',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ibuKematian!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Nomor Induk Kependudukan (NIK)',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ibuNik!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Pekerjaan Ibu',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ibuPekerjaan!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Agama Orang Tua',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ortuAgama!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Alamat Orang Tua',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ortuAlamat!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Kabupaten/Kota',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ortuAlamatKota!.value,
      ),
      SizedBox(height: 8),
      Text(
        'Kodepos',
        style: TextStyle(fontSize: 16),
      ),
      TextFormField(
        enabled: true,
        style: TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
        initialValue: state.data!.ortuAlamatKodepos!.value,
      ),
    ],
  );
}
