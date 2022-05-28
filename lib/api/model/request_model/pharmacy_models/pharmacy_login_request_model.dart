class PharmacyLoginRequestModel {
  late String username;
  late String password;

  PharmacyLoginRequestModel({required this.username, required this.password});

  toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
