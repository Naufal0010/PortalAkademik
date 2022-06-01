import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class BiodataOrangTuaProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaProfilEditableState userMahasiswaProfil =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Color(0xFFF5F6F9),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(4.0),
      //   border: Border.all(width: 1, color: Colors.white),
      // ),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Ayah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ayahNama?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Status Ayah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ayahKematian?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Nomor Induk Kependudukan (NIK)',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ayahNik?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Pekerjaan Ayah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ayahPekerjaan?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Nama Ibu',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ibuNama?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Status Ibu',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ibuKematian?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Nomor Induk Kependudukan (NIK)',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ibuNik?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Pekerjaan Ibu',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ibuPekerjaan?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Agama Orang Tua',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ortuAgama?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Alamat Orang Tua',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ortuAlamat?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Kabupaten/Kota',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ortuAlamatKota?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Kodepos',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue:
                    userMahasiswaProfil.data?.ortuAlamatKodepos?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Rata-rata penghasilan orang tua/wali per bulan',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ortuPenghasilan?.value,
              ),
              SizedBox(height: 8),
              Text(
                'Jumlah orang yang ditanggung biayanya oleh orang tua/wali',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.ortuTanggungan?.value,
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
