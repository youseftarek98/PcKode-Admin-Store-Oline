
import 'dart:io';

import 'package:admin/controller/categories/view_controller.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'
;

class CtegoriesAddController extends GetxController{

  CtegoriesData ctegoriesData = CtegoriesData(Get.find()) ;

GlobalKey<FormState> formState = GlobalKey<FormState>() ;
late TextEditingController name ;
late TextEditingController namear ;

 StatusRequest? statusRequest = StatusRequest.none;

File? file ;

chooseUmage()async {
file = await  fileUloadGallery(true) ;
update() ;
}


  addData()async{
if(formState.currentState!.validate()){
    if(file == null) Get.snackbar("Warning", 'Please Chose Image SVG') ;
    statusRequest = StatusRequest.loading ;
    update() ;
Map data = {
  "name" : name.text ,
  "namear" : namear.text
} ;

    var response = await ctegoriesData.add(data , file!);

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
    name = TextEditingController() ;
    namear = TextEditingController() ;
    super.onInit();
  }
}