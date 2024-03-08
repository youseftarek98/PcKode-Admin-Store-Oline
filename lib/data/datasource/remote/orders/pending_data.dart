import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class OrdersPendingData {
  Crud crud;

  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewpendingOrders, {});
    return response.fold((l) => 1, (r) => r);
  }


  approveOrder( String usersid , String ordersid) async {
    var response = await crud.postData(AppLink.approveOrders,
     {"usersid" :usersid , "ordersid" :ordersid });
    return response.fold((l) => 1, (r) => r);
  }


}
