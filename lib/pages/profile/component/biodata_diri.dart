import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class BiodataDiriProfile extends StatelessWidget {
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
              Text('Nama'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.nama,
                ),
              ),
              SizedBox(height: 8),
              Text('NIK'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.nik,
                ),
              ),
              SizedBox(height: 8),
              Text('NPWP'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.npwp,
                ),
              ),
              SizedBox(height: 8),
              Text('Tempat Tanggal Lahir'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      '${userMahasiswaProfil.data?.kotaKodeLahir}, ${userMahasiswaProfil.data?.tanggalLahir}',
                ),
              ),
              SizedBox(height: 8),
              Text('Jenis Kelamin'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.jenisKelamin,
                ),
              ),
              SizedBox(height: 8),
              Text('Agama'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              SizedBox(height: 8),
              Text('Status Pernikahan'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              SizedBox(height: 8),
              Text('Nomor Telepon/HP'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.noTelp,
                ),
              ),
              SizedBox(height: 8),
              Text('Email'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: userMahasiswaProfil.data?.email),
              ),
              Text('Jalur Masuk Kuliah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: userMahasiswaProfil.data?.jlrrKode),
              ),
              Text('Alamat Tinggal Saat Ini'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.alamatMhs,
                ),
              ),
              SizedBox(height: 8),
              Text('Kelurahan/Desa'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: userMahasiswaProfil.data?.kelurahan),
              ),
              Text('Kecamatan'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              SizedBox(height: 8),
              Text('Kabupaten/Kota'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              SizedBox(height: 8),
              Text('Kodepos'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.kodePos,
                ),
              ),
              SizedBox(height: 8),
              Text('Status Alamat Rumah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              SizedBox(height: 8),
              Text('Pembiayaan Kuliah Oleh'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              SizedBox(height: 8),
              Text('Jumlah Saudara Kandung'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.jumlahSaudara,
                ),
              ),
              SizedBox(height: 8),
              Text('Tinggi Badan(cm)'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.tinggiBadan,
                ),
              ),
              SizedBox(height: 8),
              Text('Berat Badan(kg)'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.beratBadan,
                ),
              ),
              SizedBox(height: 8),
              Text('Golongan Darah'),
              TextField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.golDarah,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
