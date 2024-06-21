import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/home_controller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/core/functions/translatefatabase.dart';
import 'package:fujika_ecommerce/data/model/categorymodel.dart';
import 'package:fujika_ecommerce/linkapi.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
                CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColor.backgroundcolor.withOpacity(0.1),
                  width: 3,
                ),
                color: AppColor.backgroundcolor.withOpacity(0.2),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.backgroundcolor
                        .withOpacity(0), // Color of the shadow
                    spreadRadius: 1, // How much the shadow will spread
                    blurRadius: 7, // How blurry the shadow will be
                    offset: Offset(0, 5), // Offset in the x and y direction
                  ),
                ],
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 160,
            width: 250,
            child: Hero(
              tag: "${categoriesModel.categoriesId}",
              child: Image.network(
                  fit: BoxFit.fill,
                  "${AppLink.imagestCategories}/${categoriesModel.categoriesImage}"),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.center,
            "${translateDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(
              fontSize: 13,
              color: AppColor.black,
            ),
          ),
        ],
      ),
    );
  }
}
