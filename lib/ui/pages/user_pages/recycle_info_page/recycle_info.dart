import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/constants/colors.dart';
import 'package:new_project1/ui/pages/user_pages/recycle_point_view/recycle_point_view.dart';
import 'package:new_project1/ui/widgets/buttons/custom_elevated_button.dart';

class RecycleInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Image.asset(
            'assets/icons/ekip_short.png',
            width: size.width * 0.2,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildVerticalSpace(size),
              _buildVerticalSpace(size),
              _buildVerticalSpace(size),
              Text(
                'Geri Dönüştür',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: size.width / 12,
                    fontWeight: FontWeight.w600),
              ),
              _buildVerticalSpace(size),
              Text(
                'Size en yakın ilaç toplama merkezlerinegiderek ilaçlarınızı geri dönüştürebilirsiniz',
                textAlign: TextAlign.left,
                style:
                    TextStyle(color: Colors.black, fontSize: size.width / 18),
              ),
              Text(
                'Geri dönüştürdüğünüz ilaç karşılığında toplu ulaşım kredisi kazanabilirsiniz',
                style:
                    TextStyle(color: Colors.black, fontSize: size.width / 18),
              ),
              _buildVerticalSpace(size),
              CustomElevatedButton(
                  buttonStyle: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: buttonBlue,
                      minimumSize: Size(size.width * 0.8, size.height * 0.06)),
                  child: const Text('İlaç Toplama Merkezleri'),
                  onPressed: () => Get.to(() => RecyclePointView()))
            ],
          ),
        ));
  }

  _buildVerticalSpace(size) {
    return SizedBox(
      height: size.height * 0.02,
    );
  }
}
