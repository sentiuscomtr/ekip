class ApiEndpoint {
  static const String _baseUrl = 'http://192.168.43.121:8080/api';

  //HOME-CONTROLLER
  static const String login = _baseUrl + "/home/login/user";

  //USER-CONTROLLER
  static const String userLogin = _baseUrl + '/auth/user/login';
}
