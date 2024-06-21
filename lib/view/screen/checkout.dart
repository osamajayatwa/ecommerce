import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/checkout_controller.dart';
import 'package:fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:fujika_ecommerce/core/constant/imageassests.dart';
import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/view/widget/checkout/carddeliveerytype.dart';
import 'package:fujika_ecommerce/view/widget/checkout/cardpaymentmethod.dart';
import 'package:fujika_ecommerce/view/widget/checkout/cardshippingaddress.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => HandilingDataView(
              statusrequest: controller.statusrequest,
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      const Text(
                        "Choose Payment Method",
                        style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "Cash",
                            isActive: controller.paymentMethod == "0" // cash
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 10),
                      // InkWell(
                      //   onTap: () {
                      //     controller.choosePaymentMethod("1");
                      //   },
                      //   child: CardPaymentMethodCheckout(
                      //       title: "Payment Cards",
                      //       isActive: controller.paymentMethod == "1" // Card
                      //           ? true
                      //           : false),
                      // ),
                      const SizedBox(height: 20),
                      const Text(
                        "Choose Delivery Type",
                        style: TextStyle(
                            color: AppColor.secondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              controller
                                  .chooseDeliveryType("0"); // 0 => Delivery
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: ImageAssest.deliveryImage2,
                                title: "Delivery",
                                active: controller.deliveryType == "0"
                                    ? true
                                    : false),
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              controller.chooseDeliveryType("1"); // 1 => recive
                            },
                            child: CardDeliveryTypeCheckout(
                                imagename: ImageAssest.drivethruImage,
                                title: "Revice",
                                active: controller.deliveryType == "1"
                                    ? true
                                    : false),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      if (controller.deliveryType == "0")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.dataaddress.isNotEmpty)
                              const Text(
                                "Shipping Address",
                                style: TextStyle(
                                    color: AppColor.secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            const SizedBox(
                              height: 25,
                            ),
                            if (controller.dataaddress.isEmpty)
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Please add a shipping address"),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(AppRoute.addressadd);
                                    },
                                    child: const Center(
                                        child: Text(
                                      " \n Click Here",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ],
                              ),
                            const SizedBox(height: 10),
                            ...List.generate(
                              controller.dataaddress.length,
                              (index) => InkWell(
                                onTap: () {
                                  controller.chooseShippingAddress(
                                      controller.dataaddress[index].addressId!);
                                },
                                child: CardShppingAddressCheckout(
                                    title:
                                        "${controller.dataaddress[index].addressName}",
                                    body:
                                        "${controller.dataaddress[index].addressCity} ${controller.dataaddress[index].addressStreet}",
                                    isactive: controller.addressid ==
                                            controller
                                                .dataaddress[index].addressId
                                        ? true
                                        : false),
                              ),
                            )
                          ],
                        )
                    ],
                  )))),
    );
  }
}
