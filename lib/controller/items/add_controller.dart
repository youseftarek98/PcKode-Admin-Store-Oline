import 'dart:io';

import 'package:admin/controller/items/view_controller.dart';
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/core/functions/uploadfile.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/datasource/remote/items_data.dart';
import 'package:admin/data/model/categorisemodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:get/get.dart';

class ItemsAddController extends GetxController {
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

  StatusRequest? statusRequest = StatusRequest.none;

  File? file;

  showOptionImage() {
    showbottomoenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await fileUloadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUloadGallery(false);
    update();
  }

  addData() async {
    if (formState.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", 'Please Chose Image');
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text, "namear": namear.text ,
        "desc": desc.text, "descar": descar.text ,
        "count": count.text, "discount": discount.text ,
        "catid": catid.text, "price": price.text ,
        "datenow": DateTime.now().toString()
        };

      var response = await itemsData.add(data, file!);

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

  getCategories() async {
    CtegoriesData categoriesData = CtegoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    print("================== Response Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == 'success') {
        List<CategoriesModel> data = [];
        List datalist = response["data"];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));

        for(int i = 0 ; i< data.length ; i++){
          dropdownlist.add(SelectedListItem(name: data[i].categoriesName! , value: data[i].categoriesId )) ;
        }

      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getCategories() ;
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
    super.onInit();
  }

  showDropDownList(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          'title',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: 'a'), SelectedListItem(name: 'b')],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropdownname.text = selectedListItem.name;
          //showSnackBar(list.toString());
        },
      ),
    ).showModal(context);
  }
}
