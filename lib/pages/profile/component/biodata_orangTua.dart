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
              Text('Nama Ayah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ayahNama?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Status Ayah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ayahKematian?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Nomor Induk Kependudukan (NIK)'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ayahNik?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('TPekerjaan Ayah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ayahPekerjaan?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Nama Ibu'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ibuNama?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Status Ibu'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ibuKematian?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Nomor Induk Kependudukan (NIK)'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ibuNik?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Pekerjaan Ibu'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ibuPekerjaan?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Agama Orang Tua'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ortuAgama?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Alamat Orang Tua'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ortuAlamat?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Kabupaten/Kota'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ortuAlamatKota?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Kodepos'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ortuAlamatKodepos?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Rata-rata penghasilan orang tua/wali per bulan'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ortuPenghasilan?.value,
                ),
              ),
              SizedBox(height: 8),
              Text('Jumlah orang yang ditanggung biayanya oleh orang tua/wali'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.ortuTanggungan?.value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
