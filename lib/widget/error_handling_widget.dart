import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:portal_akademik/pages/dashboard/subpages/kuesioner/subtabpages/evaluasidosen/component/empty_evaluasi_dosen.dart';
import 'package:portal_akademik/pages/dashboard/subpages/riwayatregistrasi/component/riwayat_registrasi_list_tile.dart';
import 'package:portal_akademik/pages/empty_page.dart';
import 'package:portal_akademik/pages/presensi/component/list_color_presensi.dart';
import 'package:portal_akademik/pages/presensi/component/presensi_list_detail_tile.dart';
import 'package:portal_akademik/pages/presensi/component/presensi_list_tile.dart';
import 'package:portal_akademik/pages/presensi/presensi_detail_page.dart';
import 'package:portal_akademik/states/presensi/state_user_mahasiswa_list_mk_presensi.dart';
import 'package:portal_akademik/states/state.dart';
import 'package:portal_akademik/states/state_user_mahasiswa_riwayat_registrasi.dart';
import 'package:portal_akademik/util/api_local_store.dart';
import 'package:portal_akademik/util/color_pallete.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../pages/dashboard/subpages/kuesioner/subtabpages/evaluasidosen/component/evaluasi_dosen_list_tile.dart';
import '../pages/dashboard/subpages/kuesioner/subtabpages/evaluasidosen/subpages/evaluasi_dosen_detail_page.dart';
import '../states/jadwal/state_user_mahasiswa_jadwal_matakuliah.dart';
import '../states/kuesioner/state_user_mahasiswa_data_kelas_kuesioner.dart';

Widget getErrorName(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Text('Loading');
  }

  return Text(
    '${state.data!.nama}',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );
}

Widget getErrorNim(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Text('Loading');
  }

  return Text(
    '${state.data!.nim} - ${state.data!.prodi!.jenjang} ${state.data!.prodi!.nama}',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color(0xffFFE8D1),
    ),
  );
}

Widget getErrorPhoto(BuildContext context, UserMahasiswaState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.grey,
      foregroundColor: Colors.grey,
    );
  }

  return CircleAvatar(
    radius: 25,
    backgroundImage:
        NetworkImage('https://portal.ulm.ac.id/uploads/${state.data!.foto}'),
  );
}

Widget getErrorListPresensi(
    BuildContext context, UserMahasiswaJadwalMataKuliahState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          state.refreshData();
        },
        child: Text('Refresh'),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  return Expanded(
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.data?.data?.length,
      itemBuilder: (context, index) {
        if (state.data?.data?.length == null) {
          return EmptyPage();
        } else {
          return PresensiListTile(
              color: ListColorPresensi
                  .colors[index % ListColorPresensi.colors.length],
              data: state.data!.data![index],
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        PresensiDetailPage(state.data!.data![index])));
              });
        }
      },
    ),
  );
}

Widget getErrorListDetailPresensi(
    BuildContext context, UserMahasiswaListMkPresensiState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          state.refreshData();
        },
        child: Text('Refresh'),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  if (state.data?.data?.length == null) {
    return EmptyPage();
  } else {
    return Column(
      children: state.data!.data!
          .map(
            (e) => PresensiListDetailTile(
              data: e,
              onTap: () {
                state.aksiPresensi(e.kodePertemuan);
              },
            ),
          )
          .toList(),
    );
  }

  // return Expanded(
  //   child: ListView.builder(
  //     physics: AlwaysScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     itemCount: state.data?.data?.length,
  //     itemBuilder: (context, index) {
  //       if (state.data?.data?.length == null) {
  //         return EmptyPage();
  //       } else {
  //         return PresensiListDetailTile(data: state.data!.data![index], onTap: () {  },);
  //       }
  //     },
  //   ),
  // );
}

Widget getErrorListRiwayatRegistrasi(
    BuildContext context, UserMahasiswaRiwayatRegistrasiState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          state.refreshData();
        },
        child: Text('Refresh'),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  return Expanded(
    child: ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: state.data?.data?.length,
      itemBuilder: (context, index) {
        if (state.data?.data?.length == null) {
          return EmptyPage();
        } else {
          return RiwayatRegistrasiListTile(state.data!.data![index]);
        }
      },
    ),
  );
}

Widget getErrorListKuesionerEvaluasiDosen(
    BuildContext context, UserMahasiswaDataKelasKuesionerState state) {
  if (state.error != null) {
    Fluttertoast.showToast(
        msg: "${state.error!['content']}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return Center(
      child: ElevatedButton(
        onPressed: () {
          state.refreshData();
        },
        child: Center(child: Text('Refresh')),
        style: ElevatedButton.styleFrom(
            primary: ColorPallete.primary, onPrimary: Colors.white),
      ),
    );
  }

  if (state.data?.kelas?.length == 0) {
    return EmptyEvaluasiDosen();
  }

  return ListView.builder(
    physics: AlwaysScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: state.data?.kelas?.length,
    itemBuilder: (context, index) {
      return EvaluasiDosenListTile(
          data: state.data!.kelas![index],
          onTap: () {
            UserMahasiswaDataKelasKuesionerState user =
            Provider.of<UserMahasiswaDataKelasKuesionerState>(context,
                listen: false);
            user.kelasId = state.data!.kelas![index].klsId;
            ApiLocalStorage.kelasId = state.data!.kelas![index].klsId;
            UtilLogger.log('KelasId', state.data!.kelas![index].klsId);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    EvaluasiDosenDetailPage(state.data!.kelas![index])));
          });
    },
  );
}
