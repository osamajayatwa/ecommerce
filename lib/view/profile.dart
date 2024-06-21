import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/home_controller.dart';

import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("${controller.id}")],
            )));
  }
}
