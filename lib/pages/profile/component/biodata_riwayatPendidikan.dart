import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class RiwayatPendidikanProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaState userMahasiswaProfil =
        Provider.of<UserMahasiswaState>(context, listen: true);

    UserMahasiswaProfilEditableState userMahasiswaProfile =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);

    return Container(
      width: MediaQuery.of(context).size.width,
      // padding: EdgeInsets.all(16.0),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(4.0),
      //   border: Border.all(width: 1, color: Colors.white),
      // ),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NISN',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.nisn,
              ),
              SizedBox(height: 8),
              Text(
                'Nama Sekolah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.asalSmta,
              ),
              SizedBox(height: 8),
              Text(
                'Kabupaten/Kota Sekolah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfile.data?.sekolahKota?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Total Nilai UN',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.totalNilaiUn,
              ),
              SizedBox(height: 8),
              Text(
                'Rata-Rata Nilai UN',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.rataNilaiUn,
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
