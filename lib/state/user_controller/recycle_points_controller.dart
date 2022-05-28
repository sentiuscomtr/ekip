import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project1/api/model/response_model/komek_response_model.dart';
import 'package:new_project1/api/service/user_services/recycle_points_service.dart';
import 'package:new_project1/ui/widgets/snackbar/snackbar.dart';
import 'package:permission_handler/permission_handler.dart';

class RecyclePointsController extends GetxController {
  final RecyclePointService _pointService = RecyclePointService();
  List<KomekResponseModel> recyclePointList = [];

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
  var center = const LatLng(0, 0).obs;
  var isBottomSheetOpen = false.obs;

  @override
  void onInit() async {
    isLoading(true);
    update();

    Map<Permission, PermissionStatus> statuses =
        await [Permission.location].request();
    await getRecyclePoints();
    position.value = await _determinePosition();
    center.value = LatLng(position.value.latitude, position.value.longitude);

    super.onInit();

    isLoading(false);
    update();
  }

  Future getRecyclePoints() async {
    final res = await _pointService.getRecyclePoints();

    if (res is List<KomekResponseModel>) {
      log(res.length.toString());
      recyclePointList = res;
    } else {
      CustomSnackbar.getSnackbar(
          'HATA', 'Something went wrong!', SnackbarType.ERROR);
    }
  }

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
}
