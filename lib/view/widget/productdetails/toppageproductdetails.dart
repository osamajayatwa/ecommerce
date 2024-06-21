import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/productdetails_controller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class TopProductPageDetails extends GetView<ProductDetailsControllerImp> {
  const TopProductPageDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(color: AppColor.secondColor),
        ),
        Positioned(
            top: 30.0,
            right: Get.width / 8,
            left: Get.width / 8,
            child: Hero(
              tag: "${controller.itemsModel.itemsId}",
              child: Image.network(
                "${AppLink.imagestItems}/${controller.itemsModel.itemsImage!}",
                height: 250,
                fit: BoxFit.fill,
              ),
            ))
      ],
    );
  }
}
