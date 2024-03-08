import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class OrdersArchiveData {
  Crud crud;

  OrdersArchiveData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewarchiveOrders, {});
    return response.fold((l) => 1, (r) => r);
  }

 
 
}
