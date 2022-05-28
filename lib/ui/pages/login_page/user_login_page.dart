import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/state/user_controller/user_login_controller.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class UserLoginPage extends StatelessWidget {
  final controller = Get.put(UserLoginController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            color: loginBgColor,
            child: Obx(() {
              if (controller.step.value == UserLoginStep.phone) {
                return _buildPhoneFieldWidget(size);
              } else if (controller.step.value == UserLoginStep.password) {
                return _buildPasswordFieldWidget(size);
              } else {
                return const Center(child: Text('Something Went Wrong'));
              }
            })));
  }

  Column _buildPhoneFieldWidget(size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: CustomTextField(
            onChanged: (val) {
              controller.phoneValidator();
            },
            hintText: 'Telefon Numarası',
            labelText: 'Telefon Numarası',
            controller: controller.phoneTextController,
          ),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Obx(
          () => CustomElevatedButton(
            buttonStyle: ElevatedButtonThemes.greenStyle(size.width * 0.7,
                size.height * 0.05, controller.isPhoneValid.value),
            onPressed: () {
              controller.isPhoneValid.value ? controller.sendPhone() : null;
            },
            child: const Text('Giriş Şifresi Gönder'),
          ),
        ),
      ],
    );
  }

  _buildPasswordFieldWidget(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: size.width * 0.7,
          child: CustomTextField(
              onChanged: (val) {
                controller.passwordValidator();
              },
              controller: controller.passwordTextController,
              hintText: 'Şifre',
              labelText: 'Şifre'),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        CustomElevatedButton(
            buttonStyle: ElevatedButtonThemes.greenStyle(size.width * 0.7,
                size.height * 0.05, controller.isPasswordValid.value),
            child: const Text('Giriş Yap'),
            onPressed: () {
              controller.sendPassword();
            })
      ],
    );
  }
}
