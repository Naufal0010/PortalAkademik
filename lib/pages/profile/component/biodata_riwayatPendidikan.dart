import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class RiwayatPendidikanProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaState userMahasiswaProfil =
        Provider.of<UserMahasiswaState>(context, listen: true);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(width: 1, color: ColorPallete.primary),
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
              SizedBox(height: 8),
              Text('Nama Sekolah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.asalSmta,
                ),
              ),
              SizedBox(height: 8),
              Text('Kabupaten/Kota Sekolah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.smtaKotaKode,
                ),
              ),
              SizedBox(height: 8),
              Text('Total Nilai UN'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.totalNilaiUn,
                ),
              ),
              SizedBox(height: 8),
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
