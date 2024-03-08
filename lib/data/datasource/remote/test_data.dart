import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class TestData{
  Crud crud ;
  TestData(this.crud) ;
  getData()async{
    var response = await crud.postData( AppLink.test, {});
    return response.fold((l) => 1, (r) => r) ;

  }
}