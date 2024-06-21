import 'package:flutter/material.dart';
import 'package:fujika_ecommerce/controller/address/add_controller.dart';
import 'package:fujika_ecommerce/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressAdd extends StatelessWidget {
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('add new address'),
      ),
      body: GetBuilder<AddAddressController>(
          builder: ((controllerpage) =>
              // HandilingDataView(
              //     statusrequest: controllerpage.statusRequest,
              //     widget:

              Column(children: [
                if (controllerpage.kGooglePlex != null)
                  Expanded(
                      child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controllerpage.markers.toSet(),
                        onTap: (latlong) {
                          controllerpage.addMarkers(latlong);
                        },
                        initialCameraPosition: controllerpage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controllerpage.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                      Positioned(
                        bottom: 10,
                        child: MaterialButton(
                          minWidth: 200,
                          onPressed: () {
                            controllerpage.goToPageAddDetailsAddress();
                          },
                          color: AppColor.primaryColor,
                          textColor: Colors.white,
                          child: const Text("اكمال",
                              style: TextStyle(fontSize: 18)),
                        ),
                      )
                    ],
                  ))
              ]))

          //  )

          ),
    );
  }
}
