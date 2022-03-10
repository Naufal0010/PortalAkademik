import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/login_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/model/model_user_photo.dart';

class UserMahasiswaPhotoState with ChangeNotifier, DiagnosticableTreeMixin {
  UserPhotoMahasiswa? data;
  Map<String, dynamic>? error;

  UserMahasiswaPhotoState() {
    initData();
  }

  Future<void> initData() async {
    final res = await LoginRepository().getUserPhoto();
    if (res.code == CODE.SUCCESS) {
      data = UserPhotoMahasiswa.fromMap(res.data);
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