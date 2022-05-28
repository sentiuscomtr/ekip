import 'package:get/get.dart';

class MedDetailsController extends GetxController {
  var isLoading = false.obs;

  @override
  void onInit() {
    isLoading(true);
    update();

    getMedDetails();

    isLoading(false);
    update();
    super.onInit();
  }

  Future getMedDetails() async {}
}
