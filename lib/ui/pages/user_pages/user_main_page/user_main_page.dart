import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/ui/pages/user_pages/find_medicine_page/find_medicine_page.dart';
import 'package:new_project1/ui/pages/user_pages/recycle_point_view/recycle_point_view.dart';

class UserMainPage extends StatelessWidget {
  UserMainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: const Text('Eczanem', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildVerticalSpace(size.height),
                InkWell(
                    onTap: () => Get.to(() => FindMedicinePage()),
                    child: Image.asset('assets/icons/find_med_button.png',
                        width: size.width * 0.8)),
                _buildVerticalSpace(size.height),
                InkWell(
                    onTap: () => Get.to(() => RecyclePointView()),
                    child: Image.asset('assets/icons/recycle_button.png',
                        width: size.width * 0.8)),
                _buildVerticalSpace(size.height),
              ],
            )));
  }

  _buildVerticalSpace(double height) {
    return SizedBox(
      height: height * 0.04,
    );
  }
}
