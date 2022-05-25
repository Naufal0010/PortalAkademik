import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';

class RiwayatPendidikanProfile extends StatelessWidget {
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
              Text('Nomor Induk Mahasiswa Nasional (NISN)'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.nisn,
                ),
              ),
              Text('Nama Sekolah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.asalSmta,
                ),
              ),
              Text('Kabupaten/Kota Sekolah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Total Nilai UN'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.totalNilaiUn,
                ),
              ),
              Text('Rata-Rata Nilai UN'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.rataNilaiUn,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
