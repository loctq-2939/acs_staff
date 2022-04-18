import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../@core/repository/models/Profile.dart';
import '../@core/repository/repo/user.repo.dart';
import '../@core/repository/storage/data.storage.dart';
import '../@share/router/pages.dart';
import '../@share/utils/util.dart';

class LoginController extends GetxController {
  final _userRepo = Get.find<UserRepo>();
  final _dataStorage = Get.find<DataStorage>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onReady() {
    var profile = _dataStorage.getToken();
    if (profile != null) {
      goToAndRemoveAll(screen: ROUTER_NAVBAR);
    }
    super.onReady();
  }

  String? validator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 6 ||
        value.length > 40) {
      return 'Tên tài khoản không hợp lệ !';
    }
    return null;
  }

  Future<void> login() async {
    if (loginFormKey.currentState?.validate() == true) {
      showLoading();
      await _userRepo
          .login(
              username: userNameController.text,
              password: passwordController.text)
          .then((value) => {handlerLogin(value)});
    }
  }

  handlerLogin(Profile? value) {
    if (value != null) {
      _dataStorage.setToken(value);
      goTo(screen: ROUTER_NAVBAR);
    } else {
      showSnackBar(title: "Error", content: "Login fail");
    }
    hideLoading();
  }
}
