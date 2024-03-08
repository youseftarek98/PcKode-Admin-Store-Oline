import 'dart:async';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/data/datasource/remote/orders/details_data.dart';
import 'package:admin/data/model/cartmodel.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class OrdersDetailsController extends GetxController {
  OrdersModel? ordersModel;

  late Completer<GoogleMapController> completercontroller;
  List<Marker> markers = [];

  double? lat;

  double? long;

  //Position? postion;
  CameraPosition? cameraPosition;

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  MyServices myServices = Get.find();
  List<CartModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersDetailsData.getData(ordersModel!.ordersId!);
    print("================== Response Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    if (ordersModel!.ordersType == '0') {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel!.addressLat!),
            double.parse(ordersModel!.addressLong!)),
        zoom: 18.4746,
      );

      markers.add(Marker(
          markerId: MarkerId('1'),
          position: LatLng(double.parse(ordersModel!.addressLat!),
              double.parse(ordersModel!.addressLong!))));
    }
  }

  @override
  void onInit() {
    completercontroller= Completer<GoogleMapController> ();
    ordersModel = Get.arguments["ordersmodel"];
    initialData();
    getData();
    super.onInit();
  }
}
