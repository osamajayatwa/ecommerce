import 'package:fujika_ecommerce/core/class/crud.dart';
import 'package:fujika_ecommerce/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);
  getData(String userid) async {
    var response = await crud.postData(AppLink.ordersarchive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  rating(String userid, String comment, String rating) async {
    var response = await crud.postData(
        AppLink.rating, {"id": userid, "comment": comment, "rating": rating});
    return response.fold((l) => l, (r) => r);
  }
}
