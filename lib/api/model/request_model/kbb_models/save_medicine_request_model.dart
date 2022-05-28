class SaveMedicineRequestModel {
  late String name;
  late int size;

  SaveMedicineRequestModel({required this.name, required this.size});

  Map<String, dynamic> toJson() {
    return {'name': name, 'size': size};
  }
}
