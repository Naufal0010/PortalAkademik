import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_auth.dart';
import 'package:portal_akademik/util/button_profile.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/util/label_sub_header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {

    AuthState authState = Provider.of<AuthState>(context, listen: true);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelSubHeader('Profile'),
            ButtonProfile('Biodata', Icons.account_circle_rounded, () {}),
            ButtonProfile('Pengaturan', Icons.settings, () {}),
            ButtonProfile('Bantuan', Icons.help_outline, () {}),
            ButtonProfile('Keluar', Icons.logout, () {
              showAnimatedDialog(context: context, builder: (BuildContext context)  {
                return ClassicGeneralDialogWidget(
                  titleText: 'Keluar',
                  contentText: 'Ingin keluar dari akun portal akademik?',
                  negativeText: 'Tidak',
                  positiveText: 'Ya',
                  positiveTextStyle: TextStyle(color: ColorPallete.primary),
                  onPositiveClick: () {
                    authState.logout();
                    Navigator.of(context).pop();
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
