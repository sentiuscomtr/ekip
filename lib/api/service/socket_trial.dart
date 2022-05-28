import 'dart:developer';

import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

late int id;
void onConnect(StompFrame frame) {
  stompClient.subscribe(
    destination: "/chat/12",
    callback: (frame) {
      log(frame.body.toString());
    },
  );
}

final stompClient = StompClient(
  config: StompConfig.SockJS(
    url: ApiEndpoint.url,
    onConnect: onConnect,
    onWebSocketError: (dynamic error) => log(error.toString()),
  ),
);
