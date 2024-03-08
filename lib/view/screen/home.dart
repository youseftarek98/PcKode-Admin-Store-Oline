import 'package:admin/controller/home_controller.dart';
import 'package:admin/core/constant/imageassets.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/view/widget/home/cardadmin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView(
        children: [
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3 , mainAxisExtent: 150
              ) , 
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children:  [
                CardAdminHome(url: AppImageAssets.category , title: 'Categories'  , onClick: (){
                  Get.toNamed(AppRoute.categoriesview) ;
                }),
                CardAdminHome(url: AppImageAssets.product , title: 'Items', onClick: (){
                  Get.toNamed(AppRoute.itemsview) ;
                }),
                
                CardAdminHome(url: AppImageAssets.users , title: 'Users', onClick: (){}),
                CardAdminHome(url: AppImageAssets.order , title: 'Orders', onClick: (){
                  Get.toNamed(AppRoute.ordershome) ;
                }), 
                CardAdminHome(url: AppImageAssets.report , title: 'Report', onClick: (){}), 
                 CardAdminHome(url: AppImageAssets.notifications , title: 'Notifications'  , onClick: (){}),
              
              ],
              )
        ],
      ),
    );
  }
}

