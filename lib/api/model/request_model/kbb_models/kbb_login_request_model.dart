class KbbLoginRequestModel {
  late String username;
  late String password;

  KbbLoginRequestModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}
