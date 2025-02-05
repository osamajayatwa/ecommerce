import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/homescreen_controller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/core/functions/alertexitapp.dart';
import 'package:fujika_ecommerce/view/widget/home/custombottomappbarhome.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                  shape: const CircleBorder(),
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: const Icon(Icons.shopping_basket_outlined)),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: PopScope(
                canPop: false,
                onPopInvoked: (bool didPop) async {
                  alertExitApp();
                },
                child: controller.listPage.elementAt(controller.currentpage),
              ),
            ));
  }
}
