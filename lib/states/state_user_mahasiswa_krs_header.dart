import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/service/logger.dart';

import '../model/model_user_mahasiswa_krs_header.dart';

class UserMahasiswaKrsHeaderState with ChangeNotifier, DiagnosticableTreeMixin {
  UserMhsHeaderKrs? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaKrsHeaderState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getHeaderKrsMahasiswa();
    if (res.code == CODE.SUCCESS) {
      data = UserMhsHeaderKrs.fromMap(res.data);
      UtilLogger.log('message', data?.toJson());
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = false;
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    error = null;
    data = null;
    isLoading = true;
    notifyListeners();
    initData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}