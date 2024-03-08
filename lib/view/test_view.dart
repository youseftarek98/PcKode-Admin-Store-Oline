
import 'package:admin/controller/test_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: const Text('Title'),
      backgroundColor: AppColor.primaryColr,
      ),
      body: GetBuilder<TestController>(builder: (controller) {

        return HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (_ ,index){
              return Text('${controller.data}') ;
            }
            ),) ;


        // if(controller.statusRequest == StatusRequest.loading) {
        //   return const Center(child: Text('Loading'),) ;
        // }else if (controller.statusRequest == StatusRequest.offlinefailure){
        //   return const Center(child: Text('Offline Failure'),) ;
        // }else if (controller.statusRequest == StatusRequest.serverfailure){
        //   return const Center(child: Text('Server Failure'),) ;
        // }
        // else if (controller.statusRequest == StatusRequest.failure){
        //   return const Center(child: Text('No Data'),) ;
        // }
        // else{
        //   return ListView.builder(
        //     itemCount: controller.data.length,
        //     itemBuilder: (_ ,index){
        //       return Text('${controller.data}') ;
        //     }
        //     );
        // }
      }
      ),
    );
  }
}