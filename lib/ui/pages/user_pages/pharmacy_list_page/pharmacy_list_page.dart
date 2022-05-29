import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/state/user_controller/pharmacies_controller.dart';

class PharmacyListView extends StatelessWidget {
  PharmacyListView({Key? key}) : super(key: key);
  final controller = Get.put(PharmaciesController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/icons/ekip_short.png',
          width: size.width * 0.2,
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.pharmaciesList.length,
                itemBuilder: ((context, index) {
                  var element = controller.pharmaciesList[index];
                  return ListTile(title: Text(element.name));
                })),
      ),
    );
  }
}
