class MessageModel {
  late String message;
  late int pharmacyId;

  MessageModel({required this.message, required this.pharmacyId});

  Map<String, dynamic> toJson() {
    return {"message": message, "pharmacyId": pharmacyId};
  }
}
