
import 'package:admin/controller/orders/screen_controller.dart';
import 'package:admin/core/functions/alertexitapp.dart';
import 'package:admin/view/widget/orders/custombuttonappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrdersHome extends StatelessWidget {
  const OrdersHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(
            title: const Text('Orders'),
          ),
              bottomNavigationBar: const CustomButtonAppBarHome(),
              body:  controller.listPage.elementAt(controller.currentpage),
            ));
  }
}
