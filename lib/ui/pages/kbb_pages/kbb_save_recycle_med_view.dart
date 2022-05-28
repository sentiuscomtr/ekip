import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/kbb_models/save_recycle_req_model.dart';
import 'package:new_project1/state/kbb_controller/kbb_medicine_contoller.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class KbbSaveRecycleMedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(KbbMedicineController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Geri Dönüştürülecek İlaç Ekle'),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            CustomTextField(
                onChanged: (val) {},
                controller: controller.medicineId,
                hintText: 'Medicine ID',
                labelText: 'Medicine ID'),
            CustomTextField(
              onChanged: (val) {},
              controller: controller.number,
              hintText: 'Adet',
              labelText: 'Adet',
            ),
            CustomTextField(
                onChanged: (val) {},
                controller: controller.skt,
                hintText: 'Son Kullanım Tarihi',
                labelText: 'Son Kullanım Tarihi'),
            Obx(() {
              return DropdownButton<RecycleType>(
                  value: controller.selectedType.value,
                  items: RecycleType.values
                      .map((e) => DropdownMenuItem<RecycleType>(
                          value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: (e) => controller.selectRecycleType(e!));
            }),
            CustomElevatedButton(
                onPressed: () => controller.saveRecycle(),
                buttonStyle: ElevatedButtonThemes.greenStyle(
                    size.width * 0.5, size.height * 0.05, true),
                child: const Text('Ekle'))
          ],
        ));
  }
}
