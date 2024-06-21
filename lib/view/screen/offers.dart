import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/favorite_controller.dart';
import 'package:fujika_ecommerce/controller/offers.dart';
import 'package:fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/view/screen/home.dart';
import 'package:fujika_ecommerce/view/widget/home/customappbar.dart';
import 'package:fujika_ecommerce/view/widget/offers/offers.dart';
import 'package:get/get.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersControllerImp());
    Get.put(FavoriteController());
    return GetBuilder<OffersControllerImp>(
        builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  CustomAppBar(
                    mycontroller: controller.search!,
                    titleappbar: "Find Product",
                    // onPressedIcon: () {},
                    onPressedSearch: () {
                      controller.onSearchItems();
                    },
                    onChanged: (val) {
                      controller.checkSearch(val);
                    },
                    onPressedIconFavorite: () {
                      Get.toNamed(AppRoute.notification);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  !controller.isSearch
                      ? HandilingDataView(
                          statusrequest: controller.statusrequest,
                          widget: ListView.builder(
                              itemCount: controller.data.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  CustomListItemsOffers(
                                      itemsModel: controller.data[index])))
                      : ListItemsSearch(listdatamodel: controller.listdata),
                ],
              ),
            ));
  }
}
