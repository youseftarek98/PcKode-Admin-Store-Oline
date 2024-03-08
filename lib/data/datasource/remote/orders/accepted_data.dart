import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;

  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewacceptedOrders, {});
    return response.fold((l) => 1, (r) => r);
  }

  donePrepare(String ordersid , String usersid , String ordertype) async {
    var response = await crud.postData(AppLink.prepare, 
    {"ordersid": ordersid ,"usersid": usersid , "ordertype" : ordertype});
    return response.fold((l) => 1, (r) => r);
  }

}
