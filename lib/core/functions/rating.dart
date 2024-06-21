import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/orders/archive_controller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/core/constant/imageassests.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

void showdialograting(BuildContext context, ordersid) {
  showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: const Text(
              'Rating Dialog',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            // encourage your user to leave a high rating?
            message: const Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            // your app's logo?
            image: Image.asset(
              ImageAssest.logo,
              width: 150,
              height: 150,
            ),
            submitButtonText: 'Submit',
            submitButtonTextStyle: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              OrdersArchiveController controller = Get.find();
              // print('rating: ${response.rating}, comment: ${response.comment}');
              controller.submitRating(
                ordersid,
                response.comment,
                response.rating,
              );
            },
          ));
}
    // show the dialog
    