import 'package:flutter/material.dart';
// import 'package:portal_akademik/widget/widget_profile_photo.dart';
// import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';

class BiodataDiriProfile extends StatelessWidget {
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
              Text('Nama'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.nama,
                ),
              ),
              Text('NIK'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.nik,
                ),
              ),
              Text('NPWP'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.npwp,
                ),
              ),
              Text('Tempat Tanggal Lahir'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText:
                      '${userMahasiswaProfil.data?.kotaKodeLahir}, ${userMahasiswaProfil.data?.tanggalLahir}',
                ),
              ),
              Text('Jenis Kelamin'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.jenisKelamin,
                ),
              ),
              Text('Agama'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Status Pernikahan'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Nomor Telepon/HP'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.noTelp,
                ),
              ),
              Text('Email'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: userMahasiswaProfil.data?.email),
              ),
              Text('Jalur Masuk Kuliah'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: userMahasiswaProfil.data?.jlrrKode),
              ),
              Text('Alamat Tinggal Saat Ini'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Kelurahan/Desa'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: userMahasiswaProfil.data?.kelurahan),
              ),
              Text('Kecamatan'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Kabupaten/Kota'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Kodepos'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.kodePos,
                ),
              ),
              Text('Status Alamat Rumah'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Pembiayaan Kuliah Oleh'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // labelText: userMahasiswaProfil.data?.agmrId,
                ),
              ),
              Text('Jumlah Saudara Kandung'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.jumlahSaudara,
                ),
              ),
              Text('Tinggi Badan(cm)'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.tinggiBadan,
                ),
              ),
              Text('Berat Badan(kg)'),
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: userMahasiswaProfil.data?.beratBadan,
                ),
              ),
              Text('Golongan Darah'),
              TextField(
                enabled: false,
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
