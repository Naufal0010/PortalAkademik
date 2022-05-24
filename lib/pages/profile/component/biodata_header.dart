import 'package:flutter/material.dart';
import 'package:portal_akademik/widget/widget_profile_photo.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';

class BiodataHeaderProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaProfilEditableState userMahasiswaProfil =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);

    return Container(
      height: 180.0,
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
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        userMahasiswaProfil.isLoading
                            ? ShimmerWidget(
                                height: 10,
                              )
                            : getName(context, userMahasiswaProfil),
                        userMahasiswaProfil.isLoading
                            ? ShimmerWidget(
                                height: 15,
                              )
                            : getNim(context, userMahasiswaProfil),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  userMahasiswaProfil.isLoading
                      ? ShimmerWidget(
                          borderRadius: BorderRadius.circular(30.0),
                          height: 50,
                          width: 50,
                        )
                      : getPhoto(context, userMahasiswaProfil)
                ],
              )),
            ],
          ),
          SizedBox(height: 16),
          userMahasiswaProfil.isLoading
              ? ShimmerWidget(
                  height: 15,
                )
              : getProdi(context, userMahasiswaProfil)
        ],
      ),
    );
  }
}
