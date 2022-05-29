import 'dart:developer';

import 'package:new_project1/api/model/response_model/med_details_response_model.dart';
import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MedDetailsService {
  Future getMedDetails(int id) async {
    final uri = Uri.parse(ApiEndpoint.getMedDetails + '/$id');
    final headers = {'content-type': 'application/json'};

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      if (response.body == '') {
        return null;
      } else {
        var body = json.decode(utf8.decode(response.bodyBytes));
        log('body => ${body.toString()}');
        List<MedDetailsResponseModel> list = <MedDetailsResponseModel>[];
        body.forEach((element) {
          list.add(MedDetailsResponseModel(map: element));
        });
        return list;
      }
    } else {
      throw Exception('Failed to load post');
    }
  }
}
