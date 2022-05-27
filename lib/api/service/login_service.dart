import 'dart:convert';

import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/request_model/phone_login_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_project1/api/model/request_model/user_login_request_model.dart';
import 'package:new_project1/constants/api_status_codes.dart';

class LoginService {
  Future<dynamic> sendPhone(
      {required PhoneLoginRequestModel requestModel}) async {
    final uri = Uri.parse(ApiEndpoint.login);
    final body = json.encode(requestModel.toJson());
    final headers = {
      'content-type': 'application/json',
    };

    final res = await http.post(uri, body: body, headers: headers);
    if (res.statusCode == 200) {
      return LoginStatus.SUCCESSFULL;
    } else {
      return LoginStatus.FAILED;
    }
  }

  Future<dynamic> sendPassword(
      {required UserLoginRequestModel requestModel}) async {
    final uri = Uri.parse(ApiEndpoint.userLogin);
    final body = json.encode(requestModel.toJson());
    final headers = {'content-type': 'application/json'};

    final res = await http.post(uri, body: body, headers: headers);
    if (res.statusCode == 200) {
      return LoginStatus.SUCCESSFULL;
    } else {
      return LoginStatus.FAILED;
    }
  }
}
