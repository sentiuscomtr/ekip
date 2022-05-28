import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/pharmacy_models/pharmacy_login_request_model.dart';
import 'package:new_project1/api/service/pharmacy_services/pharmacy_login_service.dart';
import 'package:new_project1/constants/api_status_codes.dart';
import 'package:new_project1/ui/pages/pharmacy_pages/pharmacy_main_page.dart';
import 'package:new_project1/ui/widgets/snackbar/snackbar.dart';

class PharmacyLoginController extends GetxController {
  TextEditingController usernameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final PharmacyLoginService _loginService = PharmacyLoginService();

  @override
  onInit() {
    super.onInit();
  }

  var isUsernameValid = false.obs;
  var isPasswordValid = false.obs;
  var isFormValid = false.obs;

  Future login() async {
    final loginModel = PharmacyLoginRequestModel(
        username: usernameTextController.text,
        password: passwordTextController.text);
    final response = await _loginService.login(requestModel: loginModel);
    if (response == LoginStatus.SUCCESSFULL) {
      log('OK');
      Get.to(() => PharmacyMainPage());
    } else if (response == LoginStatus.FAILED) {
      CustomSnackbar.getSnackbar(
          'HATA', 'Bir hata meydana geldi', SnackbarType.ERROR);
    }
  }

  void userNameValidator() {
    if (usernameTextController.text.isNum &&
        usernameTextController.text.length < 12 &&
        usernameTextController.text.length >= 10) {
      isUsernameValid(true);
      update();
    } else {
      isUsernameValid(false);
      update();
    }

    if (isUsernameValid.value && isPasswordValid.value) {
      isFormValid(true);
      update();
    }

    log(isUsernameValid.toString());
    log(isFormValid.toString());
  }

  //CALLED IN PASSWORD TEXT FIELDS ON CHANGED METHOD
  void passwordValidator() {
    if (passwordTextController.text.length < 6) {
      isPasswordValid(false);
      update();
    } else if (passwordTextController.text.length == 6 &&
        passwordTextController.text.isNum) {
      isPasswordValid(true);
      update();
    }

    if (isUsernameValid.value && isPasswordValid.value) {
      isFormValid(true);
      update();
    }

    log(isPasswordValid.toString());
  }
}
