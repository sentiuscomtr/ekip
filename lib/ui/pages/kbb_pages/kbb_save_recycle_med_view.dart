import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/kbb_models/save_recycle_req_model.dart';
import 'package:new_project1/state/kbb_controller/kbb_medicine_contoller.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/ui/widgets/date_picker/date_picker_dialog.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class KbbSaveRecycleMedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = Get.put(KbbMedicineController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/icons/ekip_short.png',
            width: size.width * 0.2,
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              _buildVerticalSpace(size),
              SizedBox(
                width: size.width * 0.7,
                child: CustomTextField(
                    onChanged: (val) {},
                    controller: controller.medicineId,
                    hintText: 'Medicine ID',
                    labelText: 'Medicine ID'),
              ),
              _buildVerticalSpace(size),
              SizedBox(
                width: size.width * 0.7,
                child: CustomTextField(
                  onChanged: (val) {},
                  controller: controller.number,
                  hintText: 'Adet',
                  labelText: 'Adet',
                ),
              ),
              _buildVerticalSpace(size),
              Obx(() {
                return DateTimeInputContainer(
                    renderContext: context,
                    text: controller.sktStr.value == ''
                        ? 'Son Kullanma Tarihi'
                        : controller.sktStr.value,
                    changed: (DateTime dt) {
                      controller.listenerDateTime(dt);
                    });
              }),
              _buildVerticalSpace(size),
              Obx(() {
                return DropdownButton<RecycleType>(
                    value: controller.selectedType.value,
                    items: RecycleType.values
                        .map((e) => DropdownMenuItem<RecycleType>(
                            value: e, child: Text(_buildTrMedSit(e.name))))
                        .toList(),
                    onChanged: (e) => controller.selectRecycleType(e!));
              }),
              _buildVerticalSpace(size),
              CustomElevatedButton(
                  onPressed: () => controller.saveRecycle(),
                  buttonStyle: ElevatedButtonThemes.greenStyle(
                      size.width * 0.5, size.height * 0.05, true),
                  child: const Text('Ekle'))
            ],
          ),
        ));
  }

  _buildVerticalSpace(size) {
    return SizedBox(height: size.height * 0.03);
  }

  _buildTrMedSit(String sit) {
    switch (sit) {
      case 'CONSUME':
        return 'Kullanılabilir';
      case 'NOT_CONSUME':
        return 'Kullanılamaz';
      default:
        return '';
    }
  }
}
