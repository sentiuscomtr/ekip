import 'package:get/get.dart';
import 'package:new_project1/api/model/response_model/med_details_response_model.dart';
import 'package:new_project1/api/service/user_services/med_details_service.dart';

class MedDetailsController extends GetxController {
  MedDetailsController({required this.medId});
  int medId;
  var isLoading = false.obs;
  final MedDetailsService _detailsService = MedDetailsService();
  RxList<MedDetailsResponseModel> medDetails = <MedDetailsResponseModel>[].obs;

  @override
  void onInit() async {
    isLoading(true);
    update();

    await getMedDetails();

    isLoading(false);
    update();
    super.onInit();
  }

  Future getMedDetails() async {
    final res = await _detailsService.getMedDetails(medId);
    if (res is List<MedDetailsResponseModel>) {
      medDetails(res);
    } else if (res == null) {
      medDetails([]);
    }
  }
}
