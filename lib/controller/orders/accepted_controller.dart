import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/accepted_data.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:get/get.dart';
class OrdersAcceptedController extends GetxController {
  OrdersAcceptedData ordersAcceptedData = OrdersAcceptedData(Get.find());

  List<OrdersModel> data = [];


  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  String printOrdersType(String val) {
    if (val == '0') {
      return "admin";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == '0') {
      return "Cash On admin ";
    } else {
      return "Payment Card";
    }
  }

  String printOrdersStatus(String val) {
    if (val == '0') {
      return "Peding Approval ";
    } else if (val == '1') {
      return "The Order is being Prepared";
    } else if (val == '2') {
      return "Ready To Picked up by admin Man";
    } else if (val == '3') {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await ordersAcceptedData.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listdata = response["data"];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


   doneprepare(String ordersid , String usersid , String ordertype) async {
    data.clear();
    statusRequest = StatusRequest.loading;

    var response = await ordersAcceptedData.donePrepare(
      ordersid , usersid , ordertype
    );

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
  getOrders() ;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }





  refreshOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
