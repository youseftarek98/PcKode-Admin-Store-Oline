
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/data/datasource/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


abstract class ResetPasswordController extends GetxController{
  resetPassword();
  goToSuccessResetPassword();
}
class ResetPasswordControllerImp extends ResetPasswordController{
GlobalKey<FormState> formstate = GlobalKey<FormState>() ;

ResetPasswordData resetPasswordData = ResetPasswordData(Get.find()) ;

StatusRequest statusRequest = StatusRequest.none;

late TextEditingController password ;
late TextEditingController rePassword ;

 String? email ;



  @override
  resetPassword() {}

  @override
  goToSuccessResetPassword() async {
    if(password.text != rePassword.text) {
      return Get.defaultDialog(
      title: 'Warning' ,  middleText: "Password Not Match") ;
    }
     if(formstate.currentState!.validate()){
     statusRequest = StatusRequest.loading ;
     update() ;
    var response = await resetPasswordData.postData( email! , password.text );
    //print("================== Response Controller $response") ;
    statusRequest = handlingData(response) ;
    if(StatusRequest.success == statusRequest){
      print("================== Response Controller $response ================") ;
       if(response["status"] == "success"){
      //  data.addAll(response["data"]) ;
        Get.offNamed(AppRoute.successResetPassword) ;
       }else{
        Get.defaultDialog(title: 'Warning' , middleText: "Try Agin") ;
        statusRequest = StatusRequest.failure ;
       }
    }
    update() ;
    }else{
    print('Not Valid') ;
  }

    
  }

@override
  void onInit() {
    email = Get.arguments['email'] ;
    password = TextEditingController();
    rePassword = TextEditingController();
   
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose() ;
    rePassword.dispose() ;
  
    super.dispose();
  }

}