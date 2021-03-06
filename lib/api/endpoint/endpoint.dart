class ApiEndpoint {
  static const String _baseUrl = 'http://corap.xyz:8081/api';

  //HOME-CONTROLLER
  static const String login = _baseUrl + "/home/login/user";

  //USER-CONTROLLER
  static const String userLogin = _baseUrl + '/auth/user/login';

  static const String getPharmacies = _baseUrl + '/home/pharmacy';

  static const String getDutyPharmacies = _baseUrl + '/home/pharmacy/duty';

  static const String getChats = _baseUrl + '/user/chat';

  static const String postMessage = _baseUrl + '/user/chat';

  static const String getChatMessage = _baseUrl + '/user/chat/message/id';
  
  static const String getRecyclePoints = _baseUrl + '/home/komek';

  ///PHARMACY
  static const String pharmacyLogin = _baseUrl + '/auth/pharmacy/login';

  ///KBB
  static const String kbbLogin = _baseUrl + '/auth/kbb/login';
  static const String saveMedicine = _baseUrl + '/kbb/medicine';
  static const String saveRecycle = _baseUrl + '/kbb/recycle';

  ///Search Med
  static const String searchMed = _baseUrl + '/home/medicine';

  static const String getMedDetails = _baseUrl + '/home/medicine';
}
