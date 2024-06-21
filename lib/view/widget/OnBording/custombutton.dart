import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/onbordingcontroller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';

class CustombuttonOnBording extends GetView<OnBordingControllerImp> {
  const CustombuttonOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      height: 40,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        textColor: Colors.white,
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        child: Text("8".tr),
      ),
    );
  }
}
