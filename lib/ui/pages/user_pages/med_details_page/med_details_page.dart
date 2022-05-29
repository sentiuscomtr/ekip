import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/response_model/medicine_response_model.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/state/user_controller/med_details_controller.dart';
import 'package:new_project1/ui/pages/user_pages/drug_store_road_page/drug_store_road_page.dart';
import 'package:new_project1/ui/pages/user_pages/recycle_point_view/recycle_point_view.dart';
import 'package:new_project1/ui/pages/user_pages/user_find_drug_store/user_find_drug_store.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';

class MedDetailsPage extends StatelessWidget {
  MedDetailsPage({required this.item});

  final MedicineResponseModel item;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedDetailsController(medId: item.id));
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
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Card(
                        child: ListTile(
                          title: Text(item.name,
                              style: const TextStyle(
                                fontSize: 24,
                              )),
                          subtitle: Text(item.size.toString() + 'mg',
                              style: const TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => controller.medDetails.isEmpty
                          ? _buildInfo(size)
                          : _buildList(controller)),
                    ),
                  ),
                ],
              )));
  }

  Widget _buildInfo(size) {
    return SizedBox(
      child: Container(
        height: size.height * 0.3,
        width: size.width * 1,
        decoration: BoxDecoration(
            color: textFieldBackground,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            const Text(
                'Aradığınız ilaç, geri dönüşüm merkezlerimizde şuan için temin edilemiyor'),
            TextButton(
              child: const Text('En Yakın Eczaneler'),
              onPressed: () => Get.to(() => FindDrugStore()),
            ),
            const Text('Geçmiş Olsun')
          ],
        ),
      ),
    );
  }

  Widget _buildList(controller) {
    return ListView.builder(
        itemCount: controller.medDetails.length,
        itemBuilder: (context, index) {
          var element = controller.medDetails[index];
          return ListTile(
            trailing: CustomElevatedButton(
                buttonStyle: ElevatedButton.styleFrom(primary: buttonBlue),
                child: const Text('Yol tarifi al'),
                onPressed: () =>
                    Get.to(() => DrugStoreRoadPage(item: element))),
            title: Text(element.komekName.toString(),
                style: const TextStyle(fontSize: 16, color: Colors.black)),
            subtitle: Text('Adet: ' + element.number.toString()),
          );
        });
  }
}
