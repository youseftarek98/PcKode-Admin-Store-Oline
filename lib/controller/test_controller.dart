
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/data/datasource/remote/test_data.dart';
import 'package:get/get.dart'
;

class TestController extends GetxController{
  TestData testData = TestData(Get.find()) ;

  List data = [] ;
  late StatusRequest statusRequest ;
  getData()async{
    statusRequest = StatusRequest.loading ;
    var response = await testData.getData();
    print("================== Response Controller $response") ;
    statusRequest = handlingData(response) ;
    if(StatusRequest.success== statusRequest){
       if(response["status"] == 'success'){
        data.addAll(response["data"]) ;
       }else{
        statusRequest = StatusRequest.failure ;
       }
    }
    update() ;
  }

  @override
  void onInit() {
   getData() ;
    super.onInit();
  }
}