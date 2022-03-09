import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/login_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/model/model_user_mahasiswa.dart';

class UserMahasiswaState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswa? data;
  Map<String, dynamic>? error;

  UserMahasiswaState() {
    initData();
  }

  Future<void> initData() async {
    final res = await LoginRepository().getUser();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswa.fromMap(res.data);
      notifyListeners();
    } else {
      error = res.message;
      notifyListeners();
    }
  }

  Future<void> refreshData() async {
    error = null;
    data = null;
    notifyListeners();
    initData();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}