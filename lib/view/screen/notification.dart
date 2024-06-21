import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/notification_controller.dart';
import 'package:fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
    return GetBuilder<NotificationController>(
        builder: (controller) => HandilingDataView(
            statusrequest: controller.statusrequest,
            widget: Scaffold(
              body: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListView(children: [
                    const Center(
                        child: Text(
                      "Notification",
                      style: TextStyle(
                          fontSize: 18,
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(height: 10),
                    ...List.generate(
                        controller.data.length,
                        (index) => Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Stack(
                                children: [
                                  ListTile(
                                    title: Text(controller.data[index]
                                        ['notification_title']),
                                    subtitle: Text(controller.data[index]
                                        ['notification_body']),
                                  ),
                                  Positioned(
                                      right: 5,
                                      child: Text(
                                        Jiffy.parse(
                                                controller.data[index]
                                                    ['notification_datetime'],
                                                pattern: "yyyy-MM-dd")
                                            .fromNow(),
                                        style: const TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ))
                  ])),
            )));
  }
}
