import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project1/state/user_controller/recycle_points_controller.dart';
import 'package:new_project1/utils/map_utils.dart';

class RecyclePointView extends StatelessWidget {
  final controller = Get.put(RecyclePointsController());
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
          () => !controller.isLoading.value
              ? GoogleMap(
                  markers: _buildMarkers(size),
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: controller.center.value, zoom: 15.0))
              : const Center(child: CircularProgressIndicator()),
        ));
  }

  _buildMarkers(size) {
    return controller.recyclePointList.map((element) {
      return Marker(
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
