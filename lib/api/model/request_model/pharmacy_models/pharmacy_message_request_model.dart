class PharmacyMessageRequestModel {
  late int userId;
  late String message;

  Map<String, dynamic> toJson() {
    return {'userId': userId, 'message': message};
  }
}
