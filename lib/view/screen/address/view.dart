import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/address/view_controller.dart';
import 'package:fujika_ecommerce/core/class/handilingdataview.dart';
import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('address'),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoute.addressadd);
            },
            child: const Icon(Icons.add)),
        body: GetBuilder<AddressViewController>(
          builder: (controller) => HandilingDataView(
            statusrequest: controller.statusrequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, i) {
                return CardAddress(
                  addressModel: controller.data[i],
                  onDelete: () {
                    controller.deleteAddress(controller.data[i].addressId!);
                  },
                );
              },
            ),
          ),
        ));
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function()? onDelete;
  const CardAddress({super.key, required this.addressModel, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(addressModel.addressId ?? ''),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        if (onDelete != null) {
          onDelete!();
        }
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: AlignmentDirectional.centerEnd,
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
      ),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(addressModel.addressName!),
            subtitle: Text(
                "${addressModel.addressCity!} ${addressModel.addressStreet}"),
            trailing: IconButton(
                onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
          ),
        ),
      ),
    );
  }
}
