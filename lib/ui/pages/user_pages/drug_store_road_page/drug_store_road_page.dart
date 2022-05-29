import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project1/api/model/response_model/med_details_response_model.dart';
import 'package:new_project1/state/user_controller/user_find_drug_store_controller.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/utils/map_utils.dart';

class DrugStoreRoadPage extends StatelessWidget {
  DrugStoreRoadPage({required this.item});
  final MedDetailsResponseModel item;
  final controller = Get.put(UserFindDrugStoreController());

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
              ? Center(child: CircularProgressIndicator())
              : GoogleMap(
                  markers: Set()..add(_buildMarker(size)),
                  myLocationEnabled: true,
                  initialCameraPosition:
                      CameraPosition(target: controller.center.value, zoom: 15),
                ),
        ));
  }

  Marker _buildMarker(size) {
    return Marker(
        onTap: () => _showBottomSheet(size, item),
        infoWindow: InfoWindow(onTap: () async {
          MapUtils.openMap(item.lat, item.lang);
        }),
        markerId: MarkerId('Eczane'),
        position: LatLng(item.lat, item.lang));
  }

  _showBottomSheet(size, element) {
    Get.bottomSheet(Container(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            Text(element.name,
                style: const TextStyle(color: Colors.black, fontSize: 24)),
            SizedBox(
              height: size.height * 0.03,
            ),
            CustomElevatedButton(
              buttonStyle: ElevatedButtonThemes.amberStyle(),
              child: const Text('Haritada Göster'),
              onPressed: () async {
                MapUtils.openMap(element.lat, element.lang);
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ],
        ),
        width: size.width,
        height: size.height * 0.3,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20))));
  }
}
