import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/ui/pages/login_page/user_login_page.dart';
import 'package:new_project1/ui/pages/pharmacy_pages/pharmacy_login_page.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/themes/text_styles.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';

class RoleSelectPage extends StatelessWidget {
  const RoleSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            width: size.width,
            height: size.height,
            color: loginBgColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                    buttonStyle: ElevatedButtonThemes.loginButtonStyle(
                        size.width * 0.5, size.height * 0.06),
                    child: Text('Eczane Girişi',
                        style: TextStyles.loginButtonText()),
                    onPressed: () {
                      Get.to(() => PharmacyLoginPage());
                    }),
                SizedBox(height: size.height * 0.04),
                CustomElevatedButton(
                  buttonStyle: ElevatedButtonThemes.loginButtonStyle(
                      size.width * 0.5, size.height * 0.06),
                  child: Text('Kullanıcı Girişi',
                      style: TextStyles.loginButtonText()),
                  onPressed: () {
                    Get.to(() => UserLoginPage());
                  },
                )
              ],
            )));
  }
}
