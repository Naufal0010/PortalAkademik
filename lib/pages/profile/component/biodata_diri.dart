import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/profile/component/kabupaten_text.dart';
import 'package:portal_akademik/pages/profile/component/kecamatan_text.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';

class BiodataDiriProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaState userMahasiswaProfil =
        Provider.of<UserMahasiswaState>(context, listen: true);

    UserMahasiswaProfilEditableState userMahasiswaProfile =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);

    String isJenisKelamin(String? jenisKelamin) {
      if (jenisKelamin == 'L') {
        return 'Laki-laki';
      }

      return 'Perempuan';
    }

    return Container(
      width: MediaQuery.of(context).size.width,
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
                'Nama',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.nama,
              ),
              SizedBox(height: 8),
              Text(
                'NIK',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.nik,
              ),
              SizedBox(height: 8),
              Text(
                'NPWP',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.npwp,
              ),
              SizedBox(height: 8),
              Text(
                'Tempat Tanggal Lahir',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue:
                    '${userMahasiswaProfil.data?.kotaKodeLahir}, ${userMahasiswaProfil.data?.tanggalLahir}',
              ),
              SizedBox(height: 8),
              Text(
                'Jenis Kelamin',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue:
                    isJenisKelamin(userMahasiswaProfil.data?.jenisKelamin),
              ),
              SizedBox(height: 8),
              Text(
                'Agama',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.getAgamaValue(),
              ),
              SizedBox(height: 8),
              Text(
                'Status Pernikahan',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.getStatusNikahValue(),
              ),
              SizedBox(height: 8),
              Text(
                'Nomor Telepon/HP',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.noTelp,
              ),
              SizedBox(height: 8),
              Text(
                'Email',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                  enabled: false,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                  initialValue: userMahasiswaProfil.data?.email),
              SizedBox(height: 8),
              Text(
                'Jalur Masuk Kuliah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                  enabled: false,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                  initialValue: userMahasiswaProfil.data?.jlrrKode),
              SizedBox(height: 8),
              Text(
                'Alamat Tinggal Saat Ini',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.alamatMhs,
              ),
              SizedBox(height: 8),
              Text(
                'Kelurahan/Desa',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                  enabled: false,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                  initialValue: userMahasiswaProfil.data?.kelurahan),
              SizedBox(height: 8),
              Text(
                'Kecamatan',
                style: TextStyle(fontSize: 16),
              ),
              userMahasiswaProfile.isLoading
                  ? ShimmerWidget(height: 10)
                  : kecamatanText(context, userMahasiswaProfile),
              SizedBox(height: 8),
              Text(
                'Kabupaten/Kota',
                style: TextStyle(fontSize: 16),
              ),
              userMahasiswaProfile.isLoading
                  ? ShimmerWidget(height: 10)
                  : kabupatenText(context, userMahasiswaProfile),
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
                initialValue: userMahasiswaProfil.data?.kodePos,
              ),
              SizedBox(height: 8),
              Text(
                'Status Alamat Rumah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.getStatusAlamatRumahValue(),
              ),
              SizedBox(height: 8),
              Text(
                'Pembiayaan Kuliah Oleh',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.getPembiayaanKuliahValue(),
              ),
              SizedBox(height: 8),
              Text(
                'Jumlah Saudara Kandung',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.jumlahSaudara,
              ),
              SizedBox(height: 8),
              Text(
                'Tinggi Badan(cm)',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.tinggiBadan,
              ),
              SizedBox(height: 8),
              Text(
                'Berat Badan(kg)',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.beratBadan,
              ),
              SizedBox(height: 8),
              Text(
                'Golongan Darah',
                style: TextStyle(fontSize: 16),
              ),
              TextFormField(
                enabled: false,
                style: TextStyle(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                initialValue: userMahasiswaProfil.data?.golDarah,
              ),
              SizedBox(height: 16),
            ],
          ),
        ],
      ),
    );
  }
}
