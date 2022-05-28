import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/state/user_controller/search_med_controller.dart';
import 'package:new_project1/ui/pages/user_pages/med_details_page/med_details_page.dart';
import 'package:new_project1/ui/widgets/text_fields/custom_text_field.dart';

class FindMedicinePage extends StatelessWidget {
  final _searchController = Get.put(SearchMedController());

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
                  controller: _searchController.keywordTextController,
                  labelText: 'İlaç Ara...',
                  hintText: 'İlaç Ara...',
                  onChanged: (val) async {
                    await _searchController.search();
                  },
                ),
              ),
            ),
            _buildVerticalSpace(size),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Obx(() {
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8.0,
                        crossAxisSpacing: 8.0,
                      ),
                      itemCount: _searchController.searchResult.length,
                      itemBuilder: (context, index) {
                        var item = _searchController.searchResult[index];
                        return ListTile(
                          onTap: () => Get.to(() => MedDetailsPage()),
                          tileColor: someKindOfGrey,
                          title: Text(item.name),
                          subtitle: Text(item.size.toString() + 'mg'),
                        );
                      });
                }),
              ),
            )
          ],
        ));
  }

  _buildVerticalSpace(size) {
    return SizedBox(height: size.height * 0.03);
  }
}
