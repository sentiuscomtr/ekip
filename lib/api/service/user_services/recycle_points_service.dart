import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/response_model/komek_response_model.dart';

class RecyclePointService {
  Future getRecyclePoints() async {
    final uri = Uri.parse(ApiEndpoint.getRecyclePoints);
    final headers = {'content-type': 'application/json'};

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      List<KomekResponseModel> list = [];
      var body = json.decode(response.body);
      body.forEach((element) {
        list.add(KomekResponseModel(map: element));
      });

      return list;
    } else {
      log('FAILED');
    }
  }
}
