import 'package:fujika_ecommerce/core/class/crud.dart';
import 'package:fujika_ecommerce/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postdata(String username, String email, String password, String phone) async {
    var response = await crud.postData(AppLink.signupdata, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone
    });
    return response.fold((l) => 1, (r) => r);
  }
}
