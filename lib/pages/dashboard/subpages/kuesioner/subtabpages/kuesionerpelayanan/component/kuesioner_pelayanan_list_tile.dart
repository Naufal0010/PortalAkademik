import 'package:flutter/material.dart';

import '../../../../../../../model/kuesioner/model_user_mahasiswa_data_pelayanan.dart';
import '../../../../../../../util/color_pallete.dart';
import 'kuesioner_kategori_list_tile.dart';

class KuesionerPelayananListTile extends StatefulWidget {
  final DataKuesionerPelayanan dataKuesionerPelayanan;

  KuesionerPelayananListTile({required this.dataKuesionerPelayanan});

  @override
  State<KuesionerPelayananListTile> createState() =>
      _KuesionerPelayananListTileState();
}

enum YaTidak { Ya, Tidak }

class _KuesionerPelayananListTileState
    extends State<KuesionerPelayananListTile> {
  YaTidak? _character = YaTidak.Ya;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1, color: ColorPallete.primary),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: ColorPallete.primary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(2),
                          topRight: Radius.circular(2)),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: [
                            Text(
                              '${widget.dataKuesionerPelayanan.kategori!.kategoriNama}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: Column(children: [
                isKategoriSoalNull(
                    widget.dataKuesionerPelayanan.kategori!.kategoriSoal),
                isWajibOnly(
                    widget.dataKuesionerPelayanan.kategori!.isWajibOnly),
                KuesionerKategoriListTile(
                    dataKuesioner: widget.dataKuesionerPelayanan.kuisioner!,
                    status: widget.dataKuesionerPelayanan.kuisioner!.map((e) => e.soalStatus).toList())
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget isKategoriSoalNull(String? isNull) {
    if (isNull != null) {
      return Text(
        '${widget.dataKuesionerPelayanan.kategori!.kategoriSoal}',
        style: TextStyle(color: Colors.black),
      );
    }
    return Text('');
  }

  Widget isWajibOnly(int isWajib) {
    if (isWajib == 0) {
      return Row(
        children: [
          Expanded(
            child: ListTile(
              title: const Text('Ya'),
              leading: Radio<YaTidak>(
                value: YaTidak.Ya,
                groupValue: _character,
                onChanged: (YaTidak? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text('Tidak'),
              leading: Radio<YaTidak>(
                value: YaTidak.Tidak,
                groupValue: _character,
                onChanged: (YaTidak? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
          ),
        ],
      );
    }
    return Container();
  }
}
