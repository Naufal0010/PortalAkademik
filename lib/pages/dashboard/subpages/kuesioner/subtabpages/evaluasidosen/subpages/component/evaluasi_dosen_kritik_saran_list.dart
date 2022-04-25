import 'package:flutter/material.dart';

import '../../../../../../../../model/kuesioner/model_user_mahasiswa_data_detail_kuesioner.dart';
import '../../../../../../../../util/color_pallete.dart';

class EvaluasiDosenKritikSaranList extends StatelessWidget {
  final DataDosen dataDosen;

  EvaluasiDosenKritikSaranList(
      {required this.dataDosen});

  @override
  Widget build(BuildContext context) {
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
                      'Kritik dan Saran untuk ${dataDosen.nama}',
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
