import 'package:flutter/widgets.dart';
import 'package:fujika_ecommerce/controller/home_controller.dart';
import 'package:fujika_ecommerce/core/class/statusrequest.dart';
import 'package:fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:fujika_ecommerce/core/services/services.dart';
import 'package:fujika_ecommerce/data/datasource/remote/offers.dart';
import 'package:fujika_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';

abstract class OffersController extends SearchMixController {
  initialData();
}

class OffersControllerImp extends OffersController {
  MyServices myServices = Get.find();

  OffersData offers = OffersData(Get.find());
  String? username;
  String? id;
  String? lang;
  List<ItemsModel> data = [];
  late StatusRequest statusrequest;
  getData() async {
    statusrequest = StatusRequest.loading;
    var response = await offers.getData();
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      if (response['status'] == "success") {
        List listda2 = response['data'];
        data.addAll(listda2.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusrequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialData();
    getData();
    super.onInit();
  }

  @override
  initialData() {
    // myServices.sharedPreferences.clear();
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }
}
