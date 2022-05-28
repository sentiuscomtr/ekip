class DrugStoreResponseModel {
  late int id;
  late String name;
  late double lat;
  late double lang;

  DrugStoreResponseModel({required Map<String, dynamic> map}) {
    id = map['id'];
    name = map['name'];
    lat = map['lat'];
    lang = map['lang'];
  }
}
