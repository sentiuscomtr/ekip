class ApiEndpoint {
  static const String _baseUrl = 'http://192.168.43.121:8080/api';

  //HOME-CONTROLLER
  static const String login = _baseUrl + "/home/login/user";

  //USER-CONTROLLER
  static const String userLogin = _baseUrl + '/auth/user/login';

  static const String getPharmacies = _baseUrl + '/home/pharmacy';

  static const String getDutyPharmacies = _baseUrl + '/home/pharmacy/duty';

  static const String getChats = _baseUrl + '/user/chat';

  static const String postMessage = _baseUrl + '/user/chat';

  static const String getChatMessage = _baseUrl + '/user/chat/message/id';
}
