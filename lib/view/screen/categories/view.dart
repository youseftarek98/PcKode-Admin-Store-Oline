
import 'package:admin/core/constant/routes.dart';
import 'package:admin/linkapi.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    CtegoriesViewController controller = Get.put(CtegoriesViewController());
    return Scaffold(
      appBar: AppBar(title: const Text('Ctegories'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.toNamed(AppRoute.categoriesadd) ;
      } , 
      child: const Icon(Icons.add),
      ),
      body: 
      GetBuilder<CtegoriesViewController>(builder: (controller) => 
      HandlingDataView(statusRequest: controller.statusRequest,
       widget: WillPopScope(
         onWillPop: (){
          return controller.myback();
         },
         child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (_ , index){
       
              return InkWell(
                onTap: () {
                  controller.goToPageEdit(controller.data[index]);
                },
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          child: SvgPicture.network(
                          height: 100,
                            '${AppLink.imageCategories}/${controller.data[index].categoriesImage
                                          }'),
                        )) ,
                      Expanded(
                        flex: 3,
                        child: ListTile(title: Text(controller.data[index].categoriesName!) , 
                        subtitle: Text(controller.data[index].categoriesDatetime!),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                               Get.defaultDialog(title: "Warning" , middleText: "هل انت متأكد من عملية الحذف", onCancel: (){} , onConfirm: (){
                                controller.deleteCategory(controller.data[index].categoriesId!, controller.data[index].categoriesImage!) ;
                                Get.back() ;
                               }) ;
                              
                            }, icon: const Icon(Icons.delete_outline)),
                          ],
                        ),
                        )) ,
                    ],
                  )
                ),
              );
            },
          ),
         ),
       )
       ))
    );
  }
}

