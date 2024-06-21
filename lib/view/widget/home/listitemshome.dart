import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/home_controller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/core/constant/imageassests.dart';
import 'package:fujika_ecommerce/data/model/itemsmodel.dart';
import 'package:fujika_ecommerce/linkapi.dart';
import 'package:fujika_ecommerce/core/functions/translatefatabase.dart';

import 'package:get/get.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;
  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 35),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Image.network(
              "${AppLink.imagestItems}/${itemsModel.itemsImage}",
              height: 250,
              width: 170,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: const Border(
                  // top: BorderSide(width: 3, color: AppColor.grey),
                  left: BorderSide(width: 1, color: AppColor.primaryColor),
                  right: BorderSide(width: 1, color: AppColor.primaryColor),
                  bottom: BorderSide(width: 3, color: AppColor.primaryColor)),
              color: AppColor.backgroundcolor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(22),
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColor.backgroundcolor
              //         .withOpacity(0), // Color of the shadow
              //     spreadRadius: 1, // How much the shadow will spread
              //     blurRadius: 7,

              //     // How blurry the shadow will be
              //     offset: const Offset(0, 5), // Offset in the x and y direction
              //   ),
              // ],
            ),
            height: 270,
            width: 200,
          ),
          Positioned(
            top: 5,
            child: Container(
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  color: AppColor.grey.withOpacity(0.0),
                  borderRadius: BorderRadius.circular(20)),
              height: 30,
              width: 200,
              child: Text(
                textAlign: TextAlign.start,
                "   ${translateDatabase(
                  itemsModel.itemsNameAr,
                  itemsModel.itemsName,
                )}",
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
          ),
          if (itemsModel.itemsPriceDiscount == "0")
            Positioned(
                right: controller.lang == "en" ? 40 : 10,
                child: Text(
                  "    ${itemsModel.itemsPrice} \$",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColor.primaryColor,
                  ),
                )),
          if (itemsModel.itemsPriceDiscount!.isNotEmpty)
            Positioned(
                left: controller.lang == "ar" ? 40 : 10,
                bottom: 15,
                child: Column(
                  children: [
                    const Text(
                      "Rating 4.5",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColor.primaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  color: AppColor.primaryColor,
                                  Icons.star,
                                  size: 15,
                                )),
                      ],
                    ),
                  ],
                )),
          Positioned(
            right: controller.lang == "en" ? 35 : 25,
            bottom: 20,
            child: Text(
              "${itemsModel.itemsPriceDiscount} \$",
              style: const TextStyle(
                fontSize: 14,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          if (itemsModel.itemsDiscount != "0")
            Positioned(
                top: 5,
                right: controller.lang == "en" ? 40 : null,
                left: controller.lang == "ar" ? 40 : null,
                child: Image.asset(
                  ImageAssest.saleOne,
                  width: 40,
                ))
        ],
      ),
    );
  }
}
