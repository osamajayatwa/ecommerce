import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/onbordingcontroller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
//import 'package:fujika_ecommerce/data/datasource/static/static.dart';
import 'package:fujika_ecommerce/view/widget/OnBording/Customdotonbording.dart';
import 'package:fujika_ecommerce/view/widget/OnBording/custombutton.dart';
import 'package:fujika_ecommerce/view/widget/OnBording/customslider.dart';
import 'package:get/get.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControllerImp());
    return const Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(flex: 4, child: CustomSliderOnBording()),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDotOnBording(),
                      Spacer(
                        flex: 2,
                      ),
                      CustombuttonOnBording(),
                    ],
                  ))
            ],
          ),
        ));
  }
}
