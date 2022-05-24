import 'package:flutter/material.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_profil_editable.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';
// import 'package:portal_akademik/pages/profile/component/biodata_menu.dart';
import 'package:provider/provider.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/widget/widget_profile_photo.dart';

// import '../../../../util/color_pallete.dart';

class BiodataMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserMahasiswaProfilEditableState userMahasiswaProfil =
        Provider.of<UserMahasiswaProfilEditableState>(context, listen: true);

    Future<void> refresh() {
      userMahasiswaProfil.refreshData();
      return userMahasiswaProfil.refreshData();
    }

    return Scaffold(
      appBar: AppBar(
          // leading: const Icon(Icons.settings),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xff4848),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: false),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 150.0,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFFFF9F43),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Container(
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
                                  : getErrorName(context, userMahasiswaProfil),
                              userMahasiswaProfil.isLoading
                                  ? ShimmerWidget(
                                      height: 15,
                                    )
                                  : getErrorNim(context, userMahasiswaProfil),
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
                            : getErrorPhoto(context, userMahasiswaProfil)
                      ],
                    )),
                  ),
                )
              ],

              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Stack(
              //           children: [
              //             Container(
              //               width: double.infinity,
              //               padding: EdgeInsets.all(36.0),
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(4.0),
              //                 border:
              //                     Border.all(width: 1, color: ColorPallete.primary),
              //               ),
              //               child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       '${userMahasiswaProfil.data?.nama}',
              //                       style: TextStyle(
              //                           overflow: TextOverflow.ellipsis,
              //                           fontSize: 12.0),
              //                     ),
              //                   ]),
              //             ),
              //             Positioned(
              //               top: 0,
              //               right: 0,
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   color: ColorPallete.primary,
              //                   borderRadius: BorderRadius.only(
              //                     bottomLeft: Radius.circular(20),
              //                   ),
              //                 ),
              //                 width: 120,
              //                 height: 32,
              //               ),
              //             ),
              //           ],
              //         ),
              //         Container(
              //           padding: EdgeInsets.all(10.0),
              //           // decoration: BoxDecoration(
              //           //   borderRadius: BorderRadius.circular(10.0),
              //           //   border: Border.all(
              //           //       width: 1, color: ColorPallete.primary),
              //           //   // color: Colors.amber,
              //           // ),
              //         )
              //       ],
              //     ),
              //   ),
            ),
          ),
        ),
      ),
    );

    // return SafeArea(
    //   child: AppBar(
    //     leading: const Icon(Icons.settings),
    //     centerTitle: false,
    //     backgroundColor: Colors.white,
    //     foregroundColor: const Color(0xff484848),
    //     elevation: 0.0,
    // actions: [
    //   SingleChildScrollView(
    //     physics: AlwaysScrollableScrollPhysics(),
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Container(
    //           height: 80.0,
    //           padding: EdgeInsets.all(16.0),
    //           decoration: BoxDecoration(
    //             color: Color(0xFFFF9F43),
    //             borderRadius: BorderRadius.all(Radius.circular(10)),
    //           ),
    //           child: Container(
    //               child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: <Widget>[
    //               userMahasiswaProfil.isLoading
    //                   ? ShimmerWidget(
    //                       borderRadius: BorderRadius.circular(30.0),
    //                       height: 50,
    //                       width: 50,
    //                     )
    //                   : getErrorPhoto(context, userMahasiswaProfil)
    //             ],
    //           )),
    //         )
    //       ],
    //     ),
    //   )
    // ],
    //batas
    //   ),

    // );
  }
}
