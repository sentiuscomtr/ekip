class MedicineResponseModel {
  late int id;
  late String name;
  late int size;

  MedicineResponseModel({required Map<String, dynamic> map}) {
    id = map['id'];
    name = map['name'];
    size = map['size'];
  }
}
