import 'package:admin/bindings/intialbindings.dart';
import 'package:admin/core/localization/translation.dart';
import 'package:admin/core/services/services.dart';
import 'package:admin/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/change_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      translations: MyTranslation(),
      theme: controller.appTheme,
      //initialBinding: MyBinding(),
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
