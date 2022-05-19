import 'package:flutter/material.dart';
import 'package:portal_akademik/model/kuesioner/model_user_mahasiswa_data_kelas_kuesioner.dart';

import '../../../../../../../util/color_pallete.dart';

class EvaluasiDosenListTile extends StatelessWidget {
  final KelasMahasiswa data;
  final Function() onTap;

  EvaluasiDosenListTile({required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {

    Widget isSudahKuesioner(String message) {
      if (message == '1') {
        return Center(
          child: Icon(Icons.check_circle, color: Colors.deepOrange,),
        );
      }
      
      return Container();
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(6.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.0),
          highlightColor: ColorPallete.primary,
          splashColor: ColorPallete.primary,
          onTap: onTap,
          child: Ink(
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(6),
                          topLeft: Radius.circular(6)),
                      child: AspectRatio(
                        aspectRatio: 1 / 1,
                        child: Container(
                          decoration: BoxDecoration(color: Colors.orange),
                          child: Center(
                            child: isSudahKuesioner(data.isMengisiKuesioner),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.mkkurNamaResmi,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.more_vert_rounded,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
