

import 'package:admin/controller/categories/add_controller.dart';
import 'package:admin/controller/categories/edit_controller.dart';
import 'package:admin/core/class/handlingdataview.dart';
import 'package:admin/core/constant/color.dart';
import 'package:admin/core/functions/validinput.dart';
import 'package:admin/core/shared/custombuttom.dart';
import 'package:admin/core/shared/customtextformglobal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CtegoriesEditController controller = Get.put(CtegoriesEditController()) ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Category'),
      ),
      body: GetBuilder<CtegoriesEditController>(builder: (controller) => HandlingDataView(statusRequest: controller.statusRequest!,
       widget:  Container(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: controller.formState,
          child: ListView(
            children: [
              CustomTextFormGlobal(
                hinttext: "Category Name", 
                labeltext: "Category Name",
                 iconData: Icons.category, 
                 mycontroller: controller.name,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: false) ,
              CustomTextFormGlobal(
                hinttext: " Category Name (Arabic) ", 
                labeltext: "Category Name (Arabic)",
                 iconData: Icons.category, 
                 mycontroller: controller.namear,
                  valid: (val){
                    return validInput(val!, 1, 30, '');
                  }, 
                  isNumber: false) , 
        
                  Container(
                    padding:const  EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      color: AppColor.thirdColor,
                      textColor: AppColor.secoundColor,
                      onPressed: (){
                       controller.chooseUmage();
                      } , 
                      child: const Text('Choose Categry Image'),
                      ),
                  ) , 
        
                  if(controller.file != null)
                  SvgPicture.file(controller.file!) ,
        
                    CustomButtom(text: "Edit"  , onPressed: (){
                      controller.editData() ;
                    },)
            ],
          ),
        ),
      )),
     ) );
  }
}