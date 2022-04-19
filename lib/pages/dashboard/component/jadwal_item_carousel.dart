import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:portal_akademik/util/color_pallete.dart';

import '../../../model/jadwal/model_user_mahasiswa_jadwal_matakuliah.dart';

class JadwalItem extends StatelessWidget {
  final MataKuliah data;
  final Function() onTap;

  JadwalItem(this.data, this.onTap);

  @override
  Widget build(BuildContext context) {
    String text = data.jamKuliah;
    var waktuKuliah = text.substring(0, 5);

    return Ink(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xffFF9F43),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    waktuKuliah,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: ColorPallete.primary),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          data.mk,
                          maxLines: 2,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorPallete.primary,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 170,
                              child: Text(
                                data.ruangKuliah,
                                maxLines: 2,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 220,
                        child: Html(
                          data: """
                            ${data.dosen}
                                """,
                          style: {
                            "body": Style(
                              textOverflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              color: Colors.black,
                              margin: EdgeInsets.symmetric(horizontal: -10),
                              fontFamily: 'Poppins',
                              fontSize: FontSize(14.0),
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
