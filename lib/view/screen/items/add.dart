


import 'package:admin/controller/items/add_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombuttom.dart';
import 'package:admin/core/shared/customdropdownsearche.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ItemsAdd extends StatelessWidget {
  const ItemsAdd({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsAddController controller = Get.put(ItemsAddController()) ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Item'),
      ),
      body: GetBuilder<ItemsAddController>(builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest!,
       widget:  Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              CustomTextFormGlobal(
                hinttext: "Name", 
                labeltext: "Name",
                 iconData: Icons.category, 
                 mycontroller: controller.name,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: false) ,
              CustomTextFormGlobal(
                hinttext: " Name (Arabic) ", 
                labeltext: " Name (Arabic)",
                 iconData: Icons.category, 
                 mycontroller: controller.namear,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: false) , 

                   
                CustomTextFormGlobal(
                hinttext: "description", 
                labeltext: "description",
                 iconData: Icons.category, 
                 mycontroller: controller.desc,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: false) ,
              CustomTextFormGlobal(
                hinttext: " description (Arabic) ", 
                labeltext: " description (Arabic)",
                 iconData: Icons.category, 
                 mycontroller: controller.descar,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: false) , 



                   CustomTextFormGlobal(
                hinttext: "Count", 
                labeltext: "Count",
                 iconData: Icons.category, 
                 mycontroller: controller.count,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: true) ,
              CustomTextFormGlobal(
                hinttext: "Price ", 
                labeltext: "Price ",
                 iconData: Icons.category, 
                 mycontroller: controller.price,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: true) , 

                    CustomTextFormGlobal(
                hinttext: "Discount", 
                labeltext: "Discount",
                 iconData: Icons.category, 
                 mycontroller: controller.discount,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: true) ,
              

              CustomDropdwonSearch(
                title: "Chosse Category",
                listdata:controller.dropdownlist ,
                dropdownSelectedName: controller.catname,
                dropdownSelectedID: controller.catid,
                  ) ,
 
                  Container(
                    padding:const  EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secoundColor,
                      onPressed: (){
                       controller.showOptionImage();
                      } , 
                      child: const Text('Choose Items Image'),
                      ),
                  ) , 

                  if(controller.file != null)
                  Image.file(controller.file! , width: 100, height: 100) ,
        
                    CustomButtom(text: "Upload"  , onPressed: (){
                      controller.addData() ;
                    },)
            ],
          ),
        ),
      )),
     ) );
  }
}