
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:get/get.dart';


abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToResetPassword(String verifycode);
}
class VerifyCodeControllerImp extends VerifyCodeController{

  String? email ;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find()) ;
  
  StatusRequest statusRequest = StatusRequest.none;
   
  @override
  checkCode() {
  
  }

  @override
  goToResetPassword(verifycode) async {
     statusRequest = StatusRequest.loading ;
     update() ;
    var response = await verifyCodeForgetPasswordData.postData( email! , verifycode);
    statusRequest = handlingData(response) ;
    if(StatusRequest.success== statusRequest){
       if(response["status"] == "success"){
         Get.offNamed(AppRoute.resetPassword , arguments: {
          "email": email
        }) ;
       }else{
        Get.defaultDialog(
          title: 'Warning' ,
           middleText: "Verify Code Not Correct") ;
        statusRequest = StatusRequest.failure ;
       }
    }
    update() ;
  }

@override
  void onInit() {
      email = Get.arguments['email'] ;
    super.onInit();
  }


}