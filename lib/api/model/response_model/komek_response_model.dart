class KomekResponseModel {
  late int id;
  late String name;
  late String city;
  late double lang;
  late double lat;

  KomekResponseModel({required Map<String, dynamic> map}) {
    id = map['id'];
    name = map['name'];
    city = map['city'];
    lang = map['lang'];
    lat = map['lat'];
  }
}
