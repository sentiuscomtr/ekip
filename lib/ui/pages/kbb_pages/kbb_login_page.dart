import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/state/kbb_controller/kbb_login_controller.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class KbbLoginPage extends StatelessWidget {
  final controller = Get.put(KbbLoginController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: loginBgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.7,
                child: CustomTextField(
                    onChanged: (val) => controller.userNameValidator(),
                    controller: controller.usernameTextController,
                    hintText: 'Kullanıcı Adı',
                    labelText: 'Kullanıcı Adı'),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                width: size.width * 0.7,
                child: CustomTextField(
                  onChanged: (val) => controller.passwordValidator(),
                  controller: controller.passwordTextController,
                  hintText: 'Şifre',
                  labelText: 'Şifre',
                  obscureText: true,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Obx(
                () => CustomElevatedButton(
                    buttonStyle: ElevatedButtonThemes.greenStyle(
                        size.width * 0.7,
                        size.height * 0.05,
                        controller.isFormValid.value),
                    child: const Text('Giriş Yap'),
                    onPressed: () {
                      controller.isFormValid.value ? controller.login() : null;
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
