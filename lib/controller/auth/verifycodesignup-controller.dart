import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';


abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{

VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find()) ;

StatusRequest statusRequest = StatusRequest.none ;

String ? email ;

  @override
  checkCode() {
  
  }

  @override
  goToSuccessSignUp( verfiyCodeSignUp) async{
     statusRequest = StatusRequest.loading ;
     update() ;
    var response = await verifyCodeSignUpData.postData( email! , verfiyCodeSignUp);
    statusRequest = handlingData(response) ;
    if(StatusRequest.success== statusRequest){
       if(response["status"] == "success"){
         Get.offNamed(AppRoute.successSignUp) ;
       }else{
        Get.defaultDialog(title: 'Warning' , middleText: "Verify Code Not Correct") ;
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

reSend(){
  verifyCodeSignUpData.resendData( email! );
}


}