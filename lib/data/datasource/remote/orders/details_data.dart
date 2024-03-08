import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class OrdersDetailsData {
  Crud crud;

  OrdersDetailsData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.detailsOrders, {"id": id});
    return response.fold((l) => 1, (r) => r);
  }
}
