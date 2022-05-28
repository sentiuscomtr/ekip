import 'package:flutter/material.dart';

class RecycleInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: const [
            Text(
              'Geri Dönüştür',
              style: TextStyle(color: Colors.green),
            )
          ],
        ));
  }
}
