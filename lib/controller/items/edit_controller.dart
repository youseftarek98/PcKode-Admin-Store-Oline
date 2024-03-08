import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

   GlobalKey<FormState> formState = GlobalKey<FormState>();

  List<SelectedListItem> dropdownlist = [] ;

  late TextEditingController name;

  late TextEditingController namear;

  late TextEditingController dropdownname;

  late TextEditingController dropdownid;

  late TextEditingController desc;

  late TextEditingController descar;

  late TextEditingController count;

  late TextEditingController price;

  late TextEditingController discount;

  late TextEditingController catname;

  late TextEditingController catid;

  ItemsModel? itemsModel;

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  String? active ;

  chooseImage() async {
    file = await fileUloadGallery(true);
    update();
  }

    changeStatusActive(val) async {
    active = val;
    update();
  }

  editData() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId ,
        "active": active ,
        "imageold": itemsModel!.itemsImage ,
        "name": name.text, "namear": namear.text ,
        "desc": desc.text, "descar": descar.text ,
        "count": count.text, "discount": discount.text ,
        "catid": catid.text, "price": price.text ,
        "datenow": DateTime.now().toString()
        };


      var response = await itemsData.edit(data, file);

      print("================== Response Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == 'success') {
          Get.offNamed(AppRoute.itemsview);
          ItemsViewController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    itemsModel = Get.arguments['itemsModel'];
    name = TextEditingController();
    namear = TextEditingController();
    desc = TextEditingController();
    descar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    dropdownname = TextEditingController();
    dropdownid = TextEditingController();
    catid = TextEditingController();
    catname = TextEditingController();

    active = itemsModel!.itemsActive!;

    name.text = itemsModel!.itemsName!;
    namear.text = itemsModel!.itemsNameAr!;

    desc.text = itemsModel!.itemsDesc!;
    descar.text = itemsModel!.itemsDescAr!;

    price.text = itemsModel!.itemsPrice!;
    count.text = itemsModel!.itemsCount!;
    discount.text = itemsModel!.itemsDiscount!;

    catid.text = itemsModel!.categoriesId!;
    catname.text = itemsModel!.categoriesName!;

    super.onInit();
  }
}
