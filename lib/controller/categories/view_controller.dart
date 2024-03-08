
import 'package:admin/core/class/status_request.dart';
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/functions/handlinfdatacontroller.dart';
import 'package:admin/data/datasource/remote/categories_data.dart';
import 'package:admin/data/model/categorisemodel.dart';
import 'package:get/get.dart'
;

class CtegoriesViewController extends GetxController{
  CtegoriesData ctegoriesData = CtegoriesData(Get.find()) ;

  List<CategoriesModel> data = [] ;

  late StatusRequest statusRequest ;

  getData()async{
    data.clear() ;
    statusRequest = StatusRequest.loading ;
    update() ;
    var response = await ctegoriesData.get();
    print("================== Response Controller $response") ;
    statusRequest = handlingData(response) ;
    if(StatusRequest.success== statusRequest){
       if(response["status"] == 'success'){
        List datalist = response["data"] ;
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e))) ;
       }else{
        statusRequest = StatusRequest.failure ;
       }
    }
    update() ;
  }

  deleteCategory(String id , String imagename){
    ctegoriesData.delete({"id":id , "imagename" : imagename}) ;
    data.removeWhere((element) => element.categoriesId == id) ;
    update() ;
  }


  goToPageEdit(CategoriesModel categoriesModel){
    Get.toNamed(
      AppRoute.categoriesedit ,arguments: {
        'categoriesModel' : categoriesModel
      }
    ) ;
  }

  @override
  void onInit() {
   getData() ;
    super.onInit();
  }


myback(){
  Get.offAllNamed(AppRoute.homePage) ;
  return Future.value(false) ;
}

}