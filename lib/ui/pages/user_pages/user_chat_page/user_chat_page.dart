import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/state/user_chat_controller.dart';

class UserChatPage extends StatelessWidget {
  final controller = Get.put(UserChatController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('İletişim'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Expanded(
              flex: 2,
              child: DrugStoreInfoCard(
                title: 'Title',
                situation: 'Open',
              )),
          Expanded(
              flex: 15,
              child: Container(
                  color: grey,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return Padding(
                            child: _buildMyMessageBox(),
                            padding: EdgeInsets.only(
                              left: size.width * 0.1,
                              right: 8,
                              bottom: 4,
                              top: 2,
                            ));
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: size.width * 0.1,
                            left: 8,
                            bottom: 4,
                            top: 2,
                          ),
                          child: _buildOtherMessageBox(),
                        );
                      }
                    },
                  )))
        ],
      ),
    );
  }

  _buildMyMessageBox() {
    return Container(
        child: const ListTile(
          title: Text(
            'MESSAGE',
            textAlign: TextAlign.right,
          ),
          subtitle: Text(
            '19 Mayıs 2022',
            textAlign: TextAlign.right,
          ),
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )));
  }

  _buildOtherMessageBox() {
    return Container(
        child: const ListTile(
          title: Text('MESSAGE'),
          subtitle: Text('19 Mayıs 2022'),
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )));
  }
}

class DrugStoreInfoCard extends StatelessWidget {
  final String title;
  final String situation;

  const DrugStoreInfoCard({
    Key? key,
    required this.title,
    required this.situation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text(situation)],
        )
      ])),
    );
  }
}
