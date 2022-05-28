import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/ui/pages/user_pages/med_details_page/med_details_page.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class FindMedicinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('İlaç Bul'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildVerticalSpace(size),
            Center(
              child: SizedBox(
                width: size.width * 0.7,
                child: CustomTextField(
                  controller: TextEditingController(),
                  labelText: 'İlaç Ara...',
                  hintText: 'İlaç Ara...',
                  onChanged: (val) {},
                ),
              ),
            ),
            _buildVerticalSpace(size),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () => Get.to(() => MedDetailsPage()),
                          tileColor: someKindOfGrey,
                          title: Text('İLAÇ ADI'),
                          subtitle: Text('DOZ'),
                        )),
              ),
            )
          ],
        ));
  }

  _buildVerticalSpace(size) {
    return SizedBox(height: size.height * 0.03);
  }
}
