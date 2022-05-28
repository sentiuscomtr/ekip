import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/user_message_model.dart';
import 'package:new_project1/api/service/user_services/chat_service.dart';
import 'package:new_project1/api/service/user_services/socket_trial.dart';

class UserChatController extends GetxController {
  ChatService _chatService = ChatService();

  TextEditingController messageTextController = TextEditingController();
  int pharmacyId = 0;
  int chatId = 0;

  @override
  void onInit() {
    stompClient.activate();
    getChats();
    super.onInit();
  }

  Future getChats() async {
    final response = await _chatService.getChats();
  }

  Future postMessage() async {
    final messageModel = MessageModel(
        message: messageTextController.text, pharmacyId: pharmacyId);
    final response = await _chatService.sendMessage(message: messageModel);
  }

  Future getChatMessages() async {
    final response = await _chatService.getChatMessage(chatId);
  }
}
