import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/state/user_controller/pharmacies_controller.dart';

class PharmacyListView extends StatelessWidget {
  PharmacyListView({Key? key}) : super(key: key);
  final controller = Get.put(PharmaciesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eczaneler'),
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
