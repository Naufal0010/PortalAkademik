import 'package:flutter/foundation.dart';
import 'package:portal_akademik/data/repository/network_repository.dart';
import 'package:portal_akademik/model/model.dart';
import 'package:portal_akademik/util/api_local_store.dart';

class UserMahasiswaProfilEditableState
    with ChangeNotifier, DiagnosticableTreeMixin {
  UserModelMahasiswaEditable? data;
  Map<String, dynamic>? error;
  bool isLoading = true;

  UserMahasiswaProfilEditableState() {
    initData();
  }

  Future<void> initData() async {
    final res = await NetworkRepository().getUser();
    if (res.code == CODE.SUCCESS) {
      data = UserModelMahasiswaEditable.fromMap(res.data);
      isLoading = false;
      ApiLocalStorage.UserMahasiswaProfilEditable = data;
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
