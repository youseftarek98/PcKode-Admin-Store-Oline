
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyMiddleWare extends GetMiddleware {
  int? get priority => 0;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString('step') == '2') {
      return const RouteSettings(name: AppRoute.homePage);
    }
    if (myServices.sharedPreferences.getString('step') == '1') {
      return const RouteSettings(name: AppRoute.login);
    }
  }
}
