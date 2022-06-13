import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';

import 'list_biodata_orang_tua_edit.dart';

class BiodataOrangTuaEdit extends StatefulWidget {
  @override
  State<BiodataOrangTuaEdit> createState() => _BiodataOrangTuaEditState();
}

class _BiodataOrangTuaEditState extends State<BiodataOrangTuaEdit> {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaProfilEditableState userMahasiswaProfil =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);
    bool? isChecked = false;

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          listBiodataOrangTuaEdit(context, userMahasiswaProfil),
          // TODO: checkbox masih belum bisa di ceklis
          CheckboxListTile(
            title: Text('Centang jika ada mempunyai wali.'),
            controlAffinity: ListTileControlAffinity.leading,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
          Text(
            'Nama Wali',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            enabled: true,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            initialValue: userMahasiswaProfil.data!.waliNama!.value,
          ),
          SizedBox(height: 8),
          Text(
            'Alamat Wali',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            enabled: true,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            initialValue: userMahasiswaProfil.data!.waliAlamat!.value,
          ),
          SizedBox(height: 8),
          Text(
            'Nomor Telpon/Hp',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            enabled: true,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            initialValue: userMahasiswaProfil.data!.waliTelp!.value,
          ),
          SizedBox(height: 8),
          Text(
            'Provinsi',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            enabled: true,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            initialValue: userMahasiswaProfil.data!.waliAlamatProvKode!.value,
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
            initialValue: userMahasiswaProfil.data!.waliAlamatKota!.value,
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
            initialValue: userMahasiswaProfil.data!.waliAlamatKodepos!.value,
          ),
          SizedBox(height: 8),
          SizedBox(height: 8),
          Text(
            'Rata-rata penghasilan orang tua/wali per bulan',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            enabled: true,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            initialValue: userMahasiswaProfil.data!.ortuPenghasilan!.value,
          ),
          SizedBox(height: 8),
          Text(
            'Jumlah orang yang ditanggung biayanya oleh orang tua/wali',
            style: TextStyle(fontSize: 16),
          ),
          TextFormField(
            enabled: true,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            initialValue: userMahasiswaProfil.data!.ortuTanggungan!.value,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
