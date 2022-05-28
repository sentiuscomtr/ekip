import 'package:new_project1/api/model/response_model/drug_store_response_model.dart';

class PharmacViewModel {
  PharmacViewModel({required DrugStoreResponseModel model}) {
    id = model.id;
    lat = model.lat;
    lang = model.lang;
    name = model.name;
  }

  PharmacViewModel.empty();

  late int id;
  late double lat;
  late double lang;
  late String name;
}
