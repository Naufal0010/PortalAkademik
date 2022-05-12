import 'package:flutter/material.dart';

import '../../../../../../../../model/kuesioner/model_user_mahasiswa_data_detail_kuesioner.dart';
import '../../../../../../../../states/kuesioner/state_user_mahasiswa_data_kelas_kuesioner.dart';
import '../../../../../../../../states/state.dart';
import '../../../../../../../../util/color_pallete.dart';

class EvaluasiDosenKritikSaranList extends StatefulWidget {
  final DataDosen dataDosen;
  final DosenKelas dosenKelas;

  EvaluasiDosenKritikSaranList(
      {required this.dataDosen, required this.dosenKelas});

  @override
  State<EvaluasiDosenKritikSaranList> createState() => _EvaluasiDosenKritikSaranListState();
}

class _EvaluasiDosenKritikSaranListState extends State<EvaluasiDosenKritikSaranList> {
  final tfKritikSaranController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UserMahasiswaDataKelasKuesionerState user =
    Provider.of<UserMahasiswaDataKelasKuesionerState>(context,
        listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Kritik dan Saran untuk ${widget.dataDosen.nama}',
                      style: TextStyle(fontSize: 16),
                    )),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                        width: 1, color: ColorPallete.primary),
                    // color: Colors.amber,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 400,
                    ),
                    child: TextField(
                      controller: tfKritikSaranController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      maxLength: 400,
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent)),
                          hintText:
                          'Tuliskan kritik dan saran maksimal 400 karakter'),
                      onChanged: (text) {
                        user.tambahEvaluasiDosenSaran(widget.dosenKelas.nip, text);
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
