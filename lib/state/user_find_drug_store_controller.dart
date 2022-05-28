import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project1/state/pharmacies_controller.dart';
import 'dart:developer';

import 'package:permission_handler/permission_handler.dart';

class UserFindDrugStoreController extends GetxController {
  var position = Position(
          longitude: 0,
          latitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;

  var isLoading = false.obs;
  var center = LatLng(0, 0).obs;
  var isBottomSheetOpen = false.obs;
  var onlyDuty = false.obs;
  final pharmaciesController = Get.put(PharmaciesController());

  @override
  void onInit() async {
    isLoading(true);
    update();

    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();

    position.value = await _determinePosition();
    center.value = LatLng(position.value.latitude, position.value.longitude);
    print(center.value.latitude);
    print(center.value.longitude);
    isLoading(false);
    update();

    super.onInit();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      throw Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        throw Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      throw Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  void openBottomSheet() {
    isBottomSheetOpen(true);
    update();
  }

  void changeOnlyDuty() {
    onlyDuty(!onlyDuty.value);
    update();

    if (onlyDuty.value) {
      pharmaciesController.getDutyPharmacies();
    } else {
      pharmaciesController.getPharmacies();
    }
  }
}
