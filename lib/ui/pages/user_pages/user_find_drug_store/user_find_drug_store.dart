import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project1/state/pharmacies_controller.dart';
import 'package:new_project1/state/user_find_drug_store_controller.dart';
import 'package:new_project1/ui/pages/user_pages/user_chat_page/user_chat_page.dart';
import 'package:new_project1/ui/pages/user_pages/user_chats_page/user_chats_page.dart';
import 'package:new_project1/ui/themes/elevated_button_theme.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';
import 'package:new_project1/utils/map_utils.dart';

class FindDrugStore extends StatelessWidget {
  FindDrugStore({Key? key}) : super(key: key);
  final controller = Get.put(UserFindDrugStoreController());
  final pharmacyController = Get.put(PharmaciesController());

  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.chat, color: Colors.black),
              onPressed: () => Get.to(() => UserChatsPage()),
            )
          ],
          backgroundColor: Colors.white,
          title:
              const Text('Eczane Bul', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : pharmacyController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Center(
                          child: Stack(
                        children: [
                          Obx(() {
                            return GoogleMap(
                                markers: _buildMarkers(size),
                                myLocationEnabled: true,
                                initialCameraPosition: CameraPosition(
                                    target: controller.center.value,
                                    zoom: 15.0));
                          }),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Container(
                              width: size.width / 1.4,
                              height: size.height * 0.07,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all()),
                              child: Center(
                                child: CheckboxListTile(
                                  onChanged: (_) => controller.changeOnlyDuty(),
                                  value: controller.onlyDuty.value,
                                  title: const Text('Sadece Nöbetçi Eczaneler'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )));
        }));
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
            CustomElevatedButton(
                buttonStyle: ElevatedButtonThemes.amberStyle(),
                child: const Text('İletişim'),
                onPressed: () => Get.to(() => UserChatPage())),
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

  _buildMarkers(size) {
    if (controller.onlyDuty.value) {
      return pharmacyController.dutyPharmacies.map((element) {
        return Marker(
            onTap: () => _showBottomSheet(size, element),
            infoWindow: InfoWindow(
                onTap: () async {
                  MapUtils.openMap(element.lat, element.lang);
                },
                title: element.name,
                snippet: 'Google Maps'),
            position: LatLng(element.lat, element.lang),
            markerId: MarkerId(
              element.id.toString(),
            ));
      }).toSet();
    } else {
      return pharmacyController.pharmaciesList.map((element) {
        return Marker(
            onTap: () => _showBottomSheet(size, element),
            infoWindow: InfoWindow(
                onTap: () async {
                  MapUtils.openMap(element.lat, element.lang);
                },
                title: element.name,
                snippet: 'Google Maps'),
            position: LatLng(element.lat, element.lang),
            markerId: MarkerId(
              element.id.toString(),
            ));
      }).toSet();
    }
  }
}
