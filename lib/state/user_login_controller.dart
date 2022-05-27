import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/phone_login_request_model.dart';
import 'package:new_project1/api/model/request_model/user_login_request_model.dart';
import 'package:new_project1/api/service/login_service.dart';
import 'package:new_project1/constants/api_status_codes.dart';
import 'package:new_project1/ui/pages/user_pages/user_main_page/user_main_page.dart';
import 'package:new_project1/ui/widgets/snackbar/snackbar.dart';

class UserLoginController extends GetxController {
  final LoginService _loginService = LoginService();
  var phoneTextController = TextEditingController();
  var passwordTextController = TextEditingController();

  var step = UserLoginStep.phone.obs;

  @override
  void onInit() {
    super.onInit();
  }

  ///VALIDATIONS
  var isPhoneValid = false.obs;
  var isPasswordValid = false.obs;
  var isFormValid = false.obs;

  //CALLED IN PHONE TEXT FIELDS ON CHANGED METHOD
  void phoneValidator() {
    if (phoneTextController.text.isNum &&
        phoneTextController.text.length < 12 &&
        phoneTextController.text.length >= 10) {
      isPhoneValid(true);
      update();
    } else {
      isPhoneValid(false);
      update();
    }

    if (isPhoneValid.value && isPasswordValid.value) {
      isFormValid(true);
      update();
    }
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

    if (isPhoneValid.value && isPasswordValid.value) {
      isFormValid(true);
      update();
    }
  }

  Future<dynamic> sendPhone() async {
    final res = await _loginService.sendPhone(
        requestModel: PhoneLoginRequestModel(phone: phoneTextController.text));
    if (res == LoginStatus.SUCCESSFULL) {
      nextStep();
    } else {
      CustomSnackbar.getSnackbar(
          'HATA', 'Bir hata meydana geldi', SnackbarType.ERROR);
    }
  }

  Future<dynamic> sendPassword() async {
    final res = await _loginService.sendPassword(
        requestModel: UserLoginRequestModel(
            phone: phoneTextController.text,
            password: passwordTextController.text));

    if (res == LoginStatus.SUCCESSFULL) {
      Get.to(() => UserMainPage());
    } else {
      CustomSnackbar.getSnackbar(
          'HATA', 'Bir hata meydana geldi', SnackbarType.ERROR);
    }
  }

  void nextStep() {
    step.value = UserLoginStep.password;
    update();
  }
}

enum UserLoginStep { phone, password }
