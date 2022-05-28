import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/state/pharmacy_controller/pharmacy_login_contoller.dart';
import 'package:new_project1/state/user_controller/pharmacies_controller.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class PharmacyLoginPage extends StatelessWidget {
  final controller = Get.put(PharmacyLoginController());

  PharmacyLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * 0.5,
              child: CustomTextField(
                  onChanged: (val) => controller.userNameValidator(),
                  controller: controller.usernameTextController,
                  hintText: 'Kullanıcı Adı',
                  labelText: 'Kullanıcı Adı'),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              width: size.width * 0.5,
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
                  buttonStyle: ElevatedButtonThemes.greenStyle(size.width * 0.5,
                      size.height * 0.04, controller.isFormValid.value),
                  child: Text('Giriş Yap'),
                  onPressed: () => controller.login()),
            )
          ],
        ),
      ),
    );
  }
}
