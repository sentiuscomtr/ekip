import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project1/state/user_find_drug_store_controller.dart';

class FindDrugStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late GoogleMapController mapController;
    final controller = Get.put(UserFindDrugStoreController());

    final LatLng _center = const LatLng(45.521563, -122.677433);
    //get users current location an assign it to a value named location

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
              const Text('Eczane Bul', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Obx(() {
          return controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Center(
                      child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: controller.center.value, zoom: 11.0))));
        }));
  }
}
