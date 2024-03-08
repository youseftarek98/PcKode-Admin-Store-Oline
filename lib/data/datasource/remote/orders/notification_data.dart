import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class NotificationData {
  Crud crud;

  NotificationData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.notification, {"id": id});
    return response.fold((l) => 1, (r) => r);
  }
}
