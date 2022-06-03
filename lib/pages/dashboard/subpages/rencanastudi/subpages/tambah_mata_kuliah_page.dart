import 'package:flutter/material.dart';
import 'package:portal_akademik/util/service/logger.dart';
import 'package:portal_akademik/widget/shimmer_widget.dart';

import '../../../../../model/krs/model_user_mahasiswa_paket_semester_list.dart';
import '../../../../../states/krs/state_user_mahasiswa_krs.dart';
import '../../../../../states/state.dart';

class TambahMataKuliahPage extends StatefulWidget {
  const TambahMataKuliahPage({Key? key}) : super(key: key);

  @override
  State<TambahMataKuliahPage> createState() => _TambahMataKuliahPageState();
}

class _TambahMataKuliahPageState extends State<TambahMataKuliahPage> {
  String _valPaketSemester = "1";

  @override
  Widget build(BuildContext context) {


    UserMahasiswaKrsState userKrs =
        Provider.of<UserMahasiswaKrsState>(context, listen: true);

    List<ModelMahasiswaPaketSemester>? list = userKrs
        .dataPaketSemester?.data?.entries
        .map((e) => ModelMahasiswaPaketSemester(e.key, e.value))
        .toList();

    UtilLogger.log('value paket semester', list);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Tambah Mata Kuliah',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            userKrs.isLoading
                ? ShimmerWidget(
                    height: 20,
                    width: 200,
                  )
                : SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Color(0xFFE7E7E7),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                          hint: Text("Pilih Semester",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Color(0xFF808080))),
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 28,
                          value: _valPaketSemester,
                          isExpanded: true,
                          items: list?.map((value) {
                            UtilLogger.log('value paket semester', value);
                            return DropdownMenuItem(
                              child: Text(
                                value.valuePaketSemester,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                    color: Color(0xFF808080), fontSize: 14),
                              ),
                              value: value.keyPaketSemester,
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _valPaketSemester = newValue.toString();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
