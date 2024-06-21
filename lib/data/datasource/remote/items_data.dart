import 'package:fujika_ecommerce/core/class/crud.dart';
import 'package:fujika_ecommerce/linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response =
        await crud.postData(AppLink.items, {"id": id, "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
