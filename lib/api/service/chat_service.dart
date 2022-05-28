import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/request_model/user_message_model.dart';
import 'package:http/http.dart' as http;

class ChatService {
  Future<dynamic> getChats() async {
    final uri = Uri.parse(ApiEndpoint.getChats);
    final token = GetStorage().read('token');
    final headers = {"Authorization": "Bearer USER/$token"};

    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      log('SUCCESS');
    } else {
      log('FAILED');
    }
  }

  Future<dynamic> sendMessage({required MessageModel message}) async {
    final uri = Uri.parse(ApiEndpoint.postMessage);
    final token = GetStorage().read('token');
    final headers = {'Authorization:': 'Bearer USER/$token'};
    final body = json.encode(message.toJson());

    final response = await http.post(uri, body: body, headers: headers);

    if (response.statusCode == 200) {
      log('SUCCESS');
    } else {
      log('FAILED');
    }
  }

  Future<dynamic> getChatMessage(int id) async {
    final uri = Uri.parse(ApiEndpoint.getChatMessage + '/$id');
    final token = GetStorage().read('token');
    final headers = {'Authorization': 'Bearer USER/$token'};

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      log('SUCCESS');
    } else {
      log('FAILED');
    }
  }
}
