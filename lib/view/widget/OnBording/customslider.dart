import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/onbordingcontroller.dart';
import 'package:fujika_ecommerce/data/datasource/static/static.dart';
import 'package:get/get.dart';

class CustomSliderOnBording extends GetView<OnBordingControllerImp> {
  const CustomSliderOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pagecontroller,
        onPageChanged: (val) {
          controller.onPageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  onBoardingList[i].image!,
                ),
                const SizedBox(
                  height: 80,
                ),
                Text(
                  onBoardingList[i].title!,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ));
  }
}
