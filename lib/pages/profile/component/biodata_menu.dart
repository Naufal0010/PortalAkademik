import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../../../../../model/model_user_mahasiswa_editable.dart';
import '../../../../../util/color_pallete.dart';

class BiodataMenuProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.settings),
        centerTitle: false,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff484848),
        elevation: 0.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
