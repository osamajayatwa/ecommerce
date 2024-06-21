import 'package:fujika_ecommerce/core/class/crud.dart';
import 'package:fujika_ecommerce/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  loginpostdata(String email, String password) async {
    var response = await crud.postData(AppLink.logindata, {
      "email": email,
      "password": password,
    });
    print(response);
    return response.fold((l) => 1, (r) => r);
  }
}
