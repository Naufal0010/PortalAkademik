import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:portal_akademik/model/model_user_mahasiswa_jadwal_matakuliah.dart';
import 'package:portal_akademik/util/color_pallete.dart';

class PresensiListTile extends StatelessWidget {
  final Color color;
  final Datum data;
  final Function() onTap;

  PresensiListTile({required this.color, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Material(
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
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
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                      child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            decoration: BoxDecoration(color: color),
                          )),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.mk,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      SizedBox(height: 2),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Html(
                          data: """
                            ${data.dosen}
                          """,
                          style: {
                            "body": Style(
                              textOverflow: TextOverflow.ellipsis,
                              margin: EdgeInsets.symmetric(horizontal: -10),
                              fontFamily: 'Poppins',
                              fontSize: FontSize(10.0),
                            ),
                          },
                        ),
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
