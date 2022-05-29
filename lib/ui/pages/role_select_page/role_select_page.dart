import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/ui/pages/kbb_pages/kbb_login_page.dart';
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
                Image.asset('assets/icons/ekip_long.png',
                    width: size.width * 0.5),
                SizedBox(height: size.height * 0.04),
                InkWell(
                  onTap: () => Get.to(() => KbbLoginPage()),
                  child: Image.asset('assets/icons/admin_login_button.png',
                      width: size.width * 0.8),
                ),
                SizedBox(height: size.height * 0.04),
                InkWell(
                  child: Image.asset('assets/icons/user_login_button.png',
                      width: size.width * 0.8),
                  onTap: () => Get.to(() => UserLoginPage()),
                )
              ],
            )));
  }
}
