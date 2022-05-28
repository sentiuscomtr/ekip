import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/state/kbb_controller/kbb_medicine_contoller.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class KbbMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(KbbMedicineController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add, color: Colors.black),
          backgroundColor: Colors.white,
          onPressed: () => _buildAddMedicineDialog(size),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('İlaç Ekle', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: SizedBox(
                  width: size.width * 0.6,
                  child: CustomTextField(
                    controller: controller.keywordTextController,
                    hintText: 'İlaç Adı',
                    labelText: 'İlaç Adı',
                    onChanged: (val) async {
                      await controller.searchMedicine();
                    },
                  ),
                )),
            Expanded(
                flex: 9,
                child: Obx(
                  () => ListView.builder(
                      itemCount: controller.medicineList.length,
                      itemBuilder: (context, index) {
                        var item = controller.medicineList[index];
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.size.toString()),
                        );
                      }),
                ))
          ],
        ));
  }

  _buildAddMedicineDialog(size) {
    final controller = Get.put(KbbMedicineController());
    Get.defaultDialog(
        title: 'İlaç Ekle',
        content: Column(
          children: [
            CustomTextField(
              controller: controller.medicineNameTextController,
              labelText: 'İlaç Adı',
              hintText: 'İlaç Adı',
              onChanged: (val) => null,
            ),
            SizedBox(height: size.height * 0.01),
            CustomTextField(
                onChanged: (val) => null,
                controller: controller.medicineSizeTextController,
                hintText: 'Doz',
                labelText: 'Doz'),
            SizedBox(height: size.height * 0.01),
            CustomElevatedButton(
                buttonStyle: ElevatedButtonThemes.greenStyle(
                    size.width * 0.3, size.height * 0.05, true),
                child: const Text('Ekle'),
                onPressed: () => controller.saveMedicine())
          ],
        ));
  }
}
