import 'package:flutter/material.dart';
import 'package:portal_akademik/pages/presensi/component/shimmer_list_detail_tile.dart';
import 'package:portal_akademik/util/api_local_store.dart';

import '../../../../../../states/kuesioner/state_user_mahasiswa_data_pelayanan.dart';
import '../../../../../../states/state.dart';
import '../../../../../../util/color_pallete.dart';
import 'component/list_kuesioner_pelayanan.dart';

class KuesionerPelayananTabPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaDataPelayananState user =
        Provider.of<UserMahasiswaDataPelayananState>(context, listen: false);

    final tfPelayanan = TextEditingController();
    final tfPerbaikan = TextEditingController();

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              Consumer<UserMahasiswaDataPelayananState>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? ShimmerListDetailTile()
                      : ListKuesionerPelayananan(context, user);
                },
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'Kolom pendapat anda tentang pelayanan beasiswa/kesehatan/softskills/minat dan penalaran',
                    style: TextStyle(fontSize: 16),
                  )),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1, color: ColorPallete.primary),
                  color: Colors.white,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: TextField(
                    controller: tfPelayanan,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintText:
                            'Deskripsikan pendapat anda tentang pelayanan mahasiswa'),
                    onChanged: (text) {
                      user.tambahDataSaranPendapat(ApiLocalStorage.userModelMahasiswa!.nim, text);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  'Kolom upaya perbaikan tentang pelayanan beasiswa/kesehatan/softskills/minat dan penalaran',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1, color: ColorPallete.primary),
                  color: Colors.white,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: TextField(
                    controller: tfPerbaikan,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        hintText:
                            'Deskripsikan pendapat anda tentang perbaikan pelayanan mahasiswa'),
                    onChanged: (text) {
                      user.tambahDataSaranPerbaikan(ApiLocalStorage.userModelMahasiswa!.nim, text);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: Text(
                    'Simpan',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      onPrimary: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
