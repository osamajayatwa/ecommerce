import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/address/adddetails_controller.dart';
import 'package:fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:fujika_ecommerce/core/shared/custombutton.dart';
import 'package:fujika_ecommerce/view/widget/auth/costumlogintextC.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add details address'),
      ),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<AddAddressDetailsController>(
            builder: (controller) => HandilingDataView(
              statusrequest: controller.statusrequest,
              widget: ListView(children: [
                CostumTextForm(
                    hinttext: "city",
                    labeltext: "city",
                    icondata: Icons.location_city,
                    mycontroller: controller.city,
                    valid: (val) {
                      return null;
                    },
                    isNumber: false),
                const SizedBox(
                  height: 20,
                ),
                CostumTextForm(
                    hinttext: "street",
                    labeltext: "street",
                    icondata: Icons.streetview,
                    mycontroller: controller.street,
                    valid: (val) {
                      return null;
                    },
                    isNumber: false),
                const SizedBox(
                  height: 20,
                ),
                CostumTextForm(
                    hinttext: "name",
                    labeltext: "name",
                    icondata: Icons.near_me,
                    mycontroller: controller.name,
                    valid: (val) {
                      return null;
                    },
                    isNumber: false),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: "Add",
                  onPressed: () {
                    controller.addAddress();
                  },
                )
              ]),
            ),
          )),
    );
  }
}
