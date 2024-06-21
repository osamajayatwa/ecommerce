import 'package:fujika_ecommerce/core/class/statusrequest.dart';
import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/core/functions/handilingdata.dart';
import 'package:fujika_ecommerce/data/datasource/remote/auth/verifysignup.dart';
import 'package:get/get.dart';

abstract class VerifySignUpController extends GetxController {
  checkcode();
  goToSuccessSignUp(String verifycodeSignup);
}

class VerifySignUpControllerImp extends VerifySignUpController {
  VerifySignUpData verifySignUpData = VerifySignUpData(Get.find());
  String? email;
  StatusRequest statusrequest = StatusRequest.none;

  @override
  checkcode() {}

  @override
  goToSuccessSignUp(verifycodeSignup) async {
    statusrequest = StatusRequest.loading;
    update();
    var response =
        await verifySignUpData.postverifydata(email!, verifycodeSignup);
    statusrequest = handilingData(response);
    if (StatusRequest.success == statusrequest) {
      // if (response['status'] == "success") {
      Get.offNamed(AppRoute.successSignUp);
    } else {
      Get.defaultDialog(
          title: "Warning", middleText: "Verify Code Not Correct");
      statusrequest = StatusRequest.failure;
    }
    //}
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  reSend() {
    verifySignUpData.resendData(email!);
  }
}
