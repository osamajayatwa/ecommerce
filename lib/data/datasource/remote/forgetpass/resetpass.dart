import 'package:fujika_ecommerce/core/class/crud.dart';
import 'package:fujika_ecommerce/linkapi.dart';

class ResetData {
  Crud crud;
  ResetData(this.crud);
  resetdata(String email, String password) async {
    var response = await crud.postData(AppLink.resetpass, {
      "email ": email,
      "password ": password,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
