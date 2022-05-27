class PhoneLoginRequestModel {
  PhoneLoginRequestModel({required this.phone});
  final String phone;

  Map<String, String> toJson() {
    return {'phone': phone};
  }
}
