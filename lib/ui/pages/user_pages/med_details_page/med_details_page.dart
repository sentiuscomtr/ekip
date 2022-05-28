import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/ui/pages/user_pages/recycle_point_view/recycle_point_view.dart';
import 'package:new_project1/ui/pages/user_pages/user_find_drug_store/user_find_drug_store.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';

class MedDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            const ListTile(
              title: Text('Rydapt midostaurin',
                  style: TextStyle(
                    fontSize: 24,
                  )),
              subtitle: Text('100mg', style: TextStyle(fontSize: 20)),
            ),
            const Text('MERAM AILE SANAT'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Adet 50', style: TextStyle(fontSize: 20)),
                SizedBox(width: size.width * 0.2),
                CustomElevatedButton(
                    buttonStyle: ElevatedButton.styleFrom(primary: buttonBlue),
                    child: const Text('Yol tarifi al'),
                    onPressed: () => Get.to(() => FindDrugStore()))
              ],
            ),
            Divider(),
          ],
        ));
  }
}
