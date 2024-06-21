import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/core/localization/changelocal.dart';
import 'package:fujika_ecommerce/view/widget/custombuttonlang.dart';
import 'package:get/get.dart';

class Language1 extends GetView<LocaleController> {
  const Language1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 20),
            Custom(
              textbottun: "Ar",
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.homepage);
              },
            ),
            Custom(
              textbottun: "En",
              onPressed: () {
                controller.changeLang("en");

                Get.toNamed(AppRoute.homepage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
