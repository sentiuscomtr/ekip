class MedDetailsResponseModel {
  late int id;
  late String komekName;
  late int number;
  late double lat;
  late double lang;

  MedDetailsResponseModel({required Map<String, dynamic> map}) {
    id = map['komekId'] ?? 0;
    komekName = map['komekName'];
    number = map['number'];
    lat = map['lat'];
    lang = map['lang'];
  }
}
