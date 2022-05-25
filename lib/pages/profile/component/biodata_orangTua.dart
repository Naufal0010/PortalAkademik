import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';

class BiodataOrangTuaProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaProfilEditableState userMahasiswaProfil =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xFFFF9F43),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Ayah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Status Ayah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Nomor Induk Kependudukan (NIK)'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('TPekerjaan Ayah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Nama Ibu'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Status Ibu'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Nomor Induk Kependudukan (NIK)'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Pekerjaan Ibu'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Agama Orang Tua'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Alamat Orang Tua'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Kabupaten/Kota'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Kodepos'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Rata-rata penghasilan orang tua/wali per bulan'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Jumlah orang yang ditanggung biayanya oleh orang tua/wali'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
