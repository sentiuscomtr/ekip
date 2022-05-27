import 'package:flutter/material.dart';

class UserChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Expanded(
            flex: 1,
            child: DrugStoreInfoCard(
              title: 'Title',
              situation: const Text('Open'),
            )),
        Expanded(flex: 9, child: Container())
      ],
    ));
  }
}

class DrugStoreInfoCard extends StatelessWidget {
  final title;
  final situation;

  DrugStoreInfoCard({
    required this.title,
    required this.situation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(title),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [Text(situation)],
      )
    ]));
  }
}
