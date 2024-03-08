
import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categorisemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'
;

class CtegoriesEditController extends GetxController{

  CtegoriesData ctegoriesData = CtegoriesData(Get.find()) ;

GlobalKey<FormState> formState = GlobalKey<FormState>() ;
late TextEditingController name ;
late TextEditingController namear ;

CategoriesModel? categoriesModel ;

 StatusRequest? statusRequest = StatusRequest.none;

File? file ;

chooseUmage()async {
file = await  fileUloadGallery(true) ;
update() ;
}


  editData()async{
if(formState.currentState!.validate()){
    statusRequest = StatusRequest.loading ;
    update() ;
Map data = {
  "name" : name.text ,
  "namear" : namear.text ,
  "imageold":categoriesModel!.categoriesImage! ,
  "id":categoriesModel!.categoriesId!.toString()
} ;

    var response = await ctegoriesData.edit(data , file);

    print("================== Response Controller $response") ;
    statusRequest = handlingData(response) ;
    if(StatusRequest.success== statusRequest){
       if(response["status"] == 'success'){
        Get.offNamed(AppRoute.categoriesview) ;
        CtegoriesViewController c = Get.find() ;
        c.getData() ;
       }else{
        statusRequest = StatusRequest.failure ;
       }
    }
    update() ;
}

  }

  @override
  void onInit() {
    categoriesModel = Get.arguments['categoriesModel'] ;
    name = TextEditingController() ;
    namear = TextEditingController() ;
    name.text = categoriesModel!.categoriesName! ;
    namear.text = categoriesModel!.categoriesNameAr! ;
    super.onInit();
  }
}