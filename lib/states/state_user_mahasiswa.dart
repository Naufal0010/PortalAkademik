import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';

class UserMahasiswaState with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswa? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getUser();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswa.fromMap(res.data);
      isLoading = false;
      ApiLocalStorage.userModelMahasiswa = data;
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