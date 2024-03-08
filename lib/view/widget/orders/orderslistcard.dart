
import 'package:admin/controller/orders/pending_controller.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/data/model/ordersmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';


class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;

  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Order Number : #${listdata.ordersId}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(Jiffy(listdata.ordersDatetime!, 'yyyy-MM-dd').fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColr,
                        fontWeight: FontWeight.bold))
              ],
            ),
            const Divider(),
            Text(
              'Order Type : ${controller.printOrdersType(listdata.ordersType!)}',
            ),
            Text(
              'Order Price : ${listdata.ordersPrice} \$',
            ),
            Text(
              'admin Price : ${listdata.ordersPriceadmin} \$',
            ),
            Text(
              'Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)}',
            ),
            Text(
              'Order Status : ${controller.printOrdersStatus(listdata.ordersStatus!)}',
            ),
            const Divider(),
            Row(
              children: [
                Text(
                  'Total Price : ${listdata.ordersPrice} \$',
                  style: const TextStyle(
                      color: AppColor.primaryColr, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersdetails,
                        arguments: {"ordersmodel": listdata});
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.secoundColor,
                  child: const Text('Details'),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (listdata.ordersStatus == '0')
                  MaterialButton(
                    onPressed: () {
                     // controller.deleteOrder(listdata.ordersId!);
                     controller.approveOrders(listdata.ordersUsersid!, listdata.ordersId!) ;
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secoundColor,
                    child: const Text('Approve'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
