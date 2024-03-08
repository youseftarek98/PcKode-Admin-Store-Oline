
import 'package:admin/controller/orders/pending_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/view/widget/orders/orderslistcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersPendingController cartController = Get.put(OrdersPendingController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrdersPendingController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) => CardOrdersList(
                          listdata: controller.data[index],
                        )))),
      ),
    );
  }
}
