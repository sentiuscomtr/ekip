import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/state/user_chat_controller.dart';

class UserChatsPage extends StatelessWidget {
  final controller = Get.put(UserChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text('Mesajlarım')),
      body: ListView.builder(
          itemCount: 10, itemBuilder: (context, index) => const ListTile()),
    );
  }
}
