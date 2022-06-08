import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';

import '../../../../../model/krs/model_user_mahasiswa_krs.dart';
import '../../../../../model/krs/model_user_mahasiswa_krs_header.dart';
import '../../../../../util/color_pallete.dart';
import 'bottomsheet_detail_krs.dart';

class KrsListSudahAmbil extends StatelessWidget {
  final KrsListMk data;
  final Krs dataKrs;

  KrsListSudahAmbil({required this.data, required this.dataKrs});

  @override
  Widget build(BuildContext context) {

    Widget isSudahAmbil(String sudahAmbil) {
      if (sudahAmbil == "0") {
        return ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.remove, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(6),
            primary: Colors.red,
            onPrimary: Colors.black,
          ),
        );
      }
      return Container();
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorPallete.primary),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        child: InkWell(
          onTap: () {
            showFlexibleBottomSheet(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0))),
                isExpand: false,
                initHeight: 0.7,
                maxHeight: 0.7,
                context: context,
                bottomSheetColor: Colors.transparent,
                builder: (context, controller, offset) {
                  return BottomSheetDetailKrs(
                      data: data, controller: controller);
                });
          },
          splashColor: ColorPallete.primary,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.mkKode,
                      style: TextStyle(color: ColorPallete.primary),
                    ),
                    SizedBox(
                        width: 220,
                        child: Text(
                          data.mkNama,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    Text(
                      '${data.mkSksTotal} SKS',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                isSudahAmbil(dataKrs.isDikirim)
              ],
            ),
          ),
        ),
      ),
    );
  }

}
