class ApiEndpoint {
  static const String _baseUrl = 'http://192.168.43.121:8080/api';

  static const String url = 'http://192.168.43.121:8080/ws';

  //HOME-CONTROLLER
  static const String login = _baseUrl + "/home/login/user";

  //USER-CONTROLLER
  static const String userLogin = _baseUrl + '/auth/user/login';

  static const String getPharmacies = _baseUrl + '/home/pharmacy';

  static const String getDutyPharmacies = _baseUrl + '/home/pharmacy/duty';

  static const String getChats = _baseUrl + '/user/chat';

  static const String postMessage = _baseUrl + '/user/chat';

  static const String getChatMessage = _baseUrl + '/user/chat/message/id';

  ///PHARMACY
  static const String pharmacyLogin = _baseUrl + '/auth/pharmacy/login';

  ///KBB
  static const String kbbLogin = _baseUrl + '/auth/kbb/login';
  static const String saveMedicine = _baseUrl + '/kbb/medicine';
  static const String saveRecycle = _baseUrl + 'kbb/recycle';

  ///Search Med
  static const String searchMed = _baseUrl + '/home/medicine';
}
