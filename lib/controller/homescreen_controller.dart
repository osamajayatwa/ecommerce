import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/view/screen/home.dart';
import 'package:fujika_ecommerce/view/screen/myfavorite.dart';
import 'package:fujika_ecommerce/view/screen/offers.dart';
import 'package:fujika_ecommerce/view/screen/setting/settings.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const MyFavorite(),
    const OffersView(),
    const Settings()
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "favorite", "icon": Icons.favorite},
    {"title": "offers", "icon": Icons.offline_bolt_rounded},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
