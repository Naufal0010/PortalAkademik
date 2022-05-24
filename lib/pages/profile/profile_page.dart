import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_akademik/pages/profile/biodata_page.dart';
import 'package:portal_akademik/pages/profile/component/button_profile_widget.dart';
import 'package:portal_akademik/states/state.dart';
// import 'package:portal_akademik/states/state_auth.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/widget/label_sub_header_widget.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'biodata_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthState authState = Provider.of<AuthState>(context, listen: true);

    SimpleFontelicoProgressDialog _dialog =
        SimpleFontelicoProgressDialog(context: context, barrierDimisable: true);

    void logout() async {
      _dialog.show(
          message: 'Loading...',
          type: SimpleFontelicoProgressDialogType.normal,
          indicatorColor: ColorPallete.primary);
      await Future.delayed(Duration(seconds: 1));
      authState.logout();
      Navigator.of(context).pop();
      _dialog.hide();
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelSubHeader('Profile', 24),
            ButtonProfile('Biodata', Icons.account_circle_rounded, () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => BiodataMenuPage()),
              );
            }),
            ButtonProfile('Pengaturan', Icons.settings, () {}),
            ButtonProfile('Bantuan', Icons.help_outline, () {}),
            ButtonProfile('Keluar', Icons.logout, () {
              showAnimatedDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ClassicGeneralDialogWidget(
                      titleText: 'Keluar',
                      contentText: 'Ingin keluar dari akun portal akademik?',
                      negativeText: 'Tidak',
                      positiveText: 'Ya',
                      positiveTextStyle: TextStyle(color: ColorPallete.primary),
                      onPositiveClick: () {
                        logout();
                      },
                      onNegativeClick: () {
                        Navigator.of(context).pop();
                      },
                    );
                  });
            }),
          ],
        ),
      ),
    );
  }
}
