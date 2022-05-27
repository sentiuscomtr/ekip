class UserLoginRequestModel {
  final String phone;
  final String password;

  UserLoginRequestModel({required this.phone, required this.password});

  Map<String, String> toJson() {
    return {'username': phone, 'password': password};
  }
}
