import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/ui/pages/user_pages/user_find_drug_store/user_find_drug_store.dart';
import 'package:new_project1/ui/widgets/buttons/user_main_page_button.dart';

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
                UserMainPageButton(
                    title: 'En Yakın Eczaneler',
                    width: size.width * 0.7,
                    height: size.height * 0.13,
                    onPressed: () {
                      Get.to(() => FindDrugStore());
                    }),
                _buildVerticalSpace(size.height),
                UserMainPageButton(
                    title: 'Geri Dönüştür',
                    width: size.width * 0.7,
                    height: size.height * 0.13,
                    onPressed: () {}),
                _buildVerticalSpace(size.height),
                UserMainPageButton(
                    title: 'XXXXXX',
                    width: size.width * 0.7,
                    height: size.height * 0.13,
                    onPressed: () {})
              ],
            )));
  }

  _buildVerticalSpace(double height) {
    return SizedBox(
      height: height * 0.04,
    );
  }
}
