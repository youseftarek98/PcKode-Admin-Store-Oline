
import 'package:admin/controller/orders/screen_controller.dart';
import 'package:admin/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomButtonAppBarHome extends StatelessWidget {
  const CustomButtonAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(
                  controller.listPage.length ,
                  (index) {
                   
                    return  Expanded(
                          child: CustomButtonAppBar(
                              textButton: controller.buttonappbar[index]['title'],
                              iconData: controller.buttonappbar[index]['icon'],
                              onPressed: () {
                                controller.changePage(index);
                              },
                              active: controller.currentpage == index ? true : false,
                            ),
                        );
                  },
                )
              ],
            )));
  }
}
