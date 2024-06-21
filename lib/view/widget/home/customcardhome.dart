import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/home_controller.dart';

import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/core/constant/imageassests.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 200,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: ListView(
            children: [
              SizedBox(
                height: 70,
                child: Image.asset(
                  ImageAssest.saleThree,
                ),
              ),
              ListTile(
                title: Text(title,
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                subtitle: Text(body,
                    style: const TextStyle(color: Colors.white, fontSize: 25)),
              )
            ],
          ),
        ),
        // Positioned(
        //   top: 60,
        //   right: controller.lang == "en" ? -20 : -22,
        //   left: controller.lang == "ar" ? -20 : null,
        //   child: Container(
        //     height: 160,
        //     width: 160,
        //     decoration: BoxDecoration(
        //         color: AppColor.secondColor,
        //         borderRadius: BorderRadius.circular(160)),
        //     child: Image.asset(
        //       ImageAssest.saleOne,
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        // ),
      ]),
    );
  }
}
