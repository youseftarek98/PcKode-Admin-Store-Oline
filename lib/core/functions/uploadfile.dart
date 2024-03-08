import 'dart:io';

import 'package:admin/core/constant/color.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
fileUloadCamera()async{
final PickedFile? file = await ImagePicker().getImage(source: ImageSource.camera , imageQuality: 100) ;

  if(file != null){
    return File(file.path) ;
  }else{
    return null ;
  }

}



fileUloadGallery([isSvg = false])async{
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom ,
    allowedExtensions:isSvg ? [
      "svg" ,
      "SVG"
    ]: [
      "png" ,
      "PNG" ,
      "jpg" ,
      "jpeg" ,
      "gif" ,
    ]
  ) ;

  if(result != null){
    return File(result.files.single.path!) ;
  }else{
    return null ;
  }

}


showbottomoenu(fileUloadCamera() , fileUloadGallery()){
Get.bottomSheet(
  Directionality(textDirection: TextDirection.ltr, 
  child: Container(
    padding: const EdgeInsets.all(10),
    height: 200,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          
          child: const Text("Please Choose Image",
                    style: TextStyle(fontSize: 22 , color: AppColor.primaryColr , fontWeight: FontWeight.bold)),
        ) , 
        const Padding(padding: EdgeInsets.all(10.0),) , 

        ListTile(
          onTap: (){
            fileUloadCamera() ;
            Get.back() ;
          },
          leading: const Icon(Icons.camera_alt ,size: 40,),
          title: const Text("From Camera",
          style: TextStyle(fontSize: 20),
           ),
        ) ,
        ListTile(
          onTap: (){
            fileUloadCamera() ;
            Get.back() ;
          },
          leading: const Icon(Icons.image ,size: 40,),
          title: const Text("From Gallery",
          style: TextStyle(fontSize: 20),
           ),
        ) ,

      ],
    ),
  )) , 
  backgroundColor: AppColor.white
) ;

}