import 'dart:io';

import 'package:admin/core/class/crud.dart';
import 'package:admin/linkapi.dart';

class CtegoriesData{
  Crud crud ;
  CtegoriesData(this.crud) ;
  get()async{
    var response = await crud.postData( AppLink.categoriesview, {});
    return response.fold((l) => 1, (r) => r) ;

  }

    add(Map data , File file)async{
    var response = await crud.addRequestWithImageOne( AppLink.categoriesadd, data , file);
    return response.fold((l) => 1, (r) => r) ;

  }

    edit(Map data , [File? file])async{
      var response ;
    if(file == null ){
       response = await crud.postData( AppLink.categoriesedit, data);
    }else{
      response = await crud.addRequestWithImageOne( AppLink.categoriesedit, data , file);
    }
    return response.fold((l) => 1, (r) => r) ;

  }

    delete(Map data)async{
    var response = await crud.postData( AppLink.categoriesdelete, data);
    return response.fold((l) => 1, (r) => r) ;

  }
}