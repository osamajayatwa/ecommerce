import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/home_controller.dart';
import 'package:fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/core/constant/imageassests.dart';
import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/data/model/itemsmodel.dart';
import 'package:fujika_ecommerce/linkapi.dart';
import 'package:fujika_ecommerce/view/widget/home/customappbar.dart';
import 'package:fujika_ecommerce/view/widget/home/customcardhome.dart';
import 'package:fujika_ecommerce/view/widget/home/customtitlehome.dart';
import 'package:fujika_ecommerce/view/widget/home/listcategorieshome.dart';
import 'package:fujika_ecommerce/view/widget/home/listitemshome.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageAssetPaths = [
      ImageAssest.sliderone,
      ImageAssest.slidertow,
      ImageAssest.sliderthree,
      // Add more image asset paths as needed
    ];

    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                CustomAppBar(
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.notification);
                  },
                  mycontroller: controller.search!,
                  titleappbar: "Find Product",
                  onPressedIcon: () {},
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                ),
                HandilingDataView(
                    statusrequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.settingsdata.isNotEmpty)
                                CustomCardHome(
                                    title:
                                        "${controller.settingsdata[0]['settings_titlehome']}",
                                    body:
                                        "${controller.settingsdata[0]['settings_bodyhome']}"),
                              const SizedBox(
                                height: 20,
                              ),
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 130.0,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 700),
                                  viewportFraction: 1.1,
                                ),
                                items: imageAssetPaths.map((path) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            decoration: const BoxDecoration(
                                              color: AppColor.backgroundcolor,
                                            ),
                                            child: Transform(
                                              transform: Matrix4.identity()
                                                ..rotateY(0.5),
                                              alignment:
                                                  FractionalOffset.center,
                                              child: Image.asset(
                                                path,
                                                fit: BoxFit.fill,
                                              ),
                                            )),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const CustomTitleHome(title: "Categories"),
                              const ListCategoriesHome(),
                              const SizedBox(height: 10),
                              const CustomTitleHome(title: "Top selling"),
                              const SizedBox(
                                height: 30,
                              ),
                              const ListItemsHome(),
                              const SizedBox(height: 10),
                              const CustomTitleHome(title: "Recent"),
                              const SizedBox(
                                height: 30,
                              ),
                              const ListItemsHome(),
                              const SizedBox(
                                height: 50,
                              ),
                            ],
                          )
                        : ListItemsSearch(listdatamodel: controller.listdata)),
              ],
            )));
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: Image.network(
                            "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
