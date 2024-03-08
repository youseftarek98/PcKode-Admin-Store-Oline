
import 'package:admin/core/constant/routes.dart';
import 'package:admin/core/middleware/mymiddleware.dart';
import 'package:admin/view/screen/auth/forget_password/forget_passwordd.dart';
import 'package:admin/view/screen/auth/forget_password/reset_password.dart';
import 'package:admin/view/screen/auth/forget_password/success_resetpassword.dart';
import 'package:admin/view/screen/auth/forget_password/verify_code.dart';
import 'package:admin/view/screen/auth/login.dart';
import 'package:admin/view/screen/auth/success_signup.dart';
import 'package:admin/view/screen/auth/verifycodesignup.dart';
import 'package:admin/view/screen/categories/add.dart';
import 'package:admin/view/screen/categories/edit.dart';
import 'package:admin/view/screen/categories/view.dart';
import 'package:admin/view/screen/home.dart';
import 'package:admin/view/screen/items/add.dart';
import 'package:admin/view/screen/items/edit.dart';
import 'package:admin/view/screen/items/view.dart';
import 'package:admin/view/screen/language.dart';
import 'package:admin/view/screen/onboarding.dart';
import 'package:admin/view/screen/orders/archive.dart';
import 'package:admin/view/screen/orders/details.dart';
import 'package:admin/view/screen/orders/pending.dart';
import 'package:admin/view/screen/orders/screen.dart';
import 'package:get/get.dart';


List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => const Language(), middlewares: [
    MyMiddleWare()
  ]),


// Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  
  GetPage(name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
    GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerifyCodeSignUp()),

// Home Screen
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),


  //  Orders
  GetPage(name: AppRoute.ordershome, page: () => const OrdersHome()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),

  // Categories
  GetPage(name: AppRoute.categoriesview, page: () => const CategoriesView()),
  GetPage(name: AppRoute.categoriesadd, page: () => const CategoriesAdd()),
  GetPage(name: AppRoute.categoriesedit, page: () => const CategoriesEdit()),


   // Items
  GetPage(name: AppRoute.itemsview, page: () => const ItemsView()),
  GetPage(name: AppRoute.itemsadd, page: () => const ItemsAdd()),
  GetPage(name: AppRoute.itemsedit, page: () => const ItemsEdit()),
  
];



