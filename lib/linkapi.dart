class AppLink {
  //static const String server = 'https://queenpharmaeg.com/ecommercepckod';

  static const String server = 'https://pckodstore.com/ecommerce';

  ///============================= Image =============================

  static const String imagetest = 'https://pckodstore.com/ecommerce/upload';

  // static const String imagetest =
  //     'https://queenpharmaeg.com/ecommercepckod/upload';
  static const String imageCategories = '$imagetest/categories';
  static const String imageItems = '$imagetest/items';

  ///=====================================================================

  static const String test = '$server/test.php';

  ///=========================== Notification =========================== 
  static const String notification = '$server/notification.php';

  ///========================= Auth ======================================
  static const String signUp = '$server/admin/auth/signup.php';

  static const String login = '$server/admin/auth/login.php';

  static const String verifycodesignup = '$server/admin/auth/verfiycode.php';

  static const String resend = '$server/admin/auth/resend.php';

  ///========================= ForgetPassword ===========================
  static const String checkEmail = '$server/forgetpassword/checkemail.php';

  static const String resetPassword =
      '$server/forgetpassword/resetpassword.php';

  static const String verifycodeforgetpassword =
      '$server/forgetpassword/verifycode.php';

  ///========================= Home ===========================

  static const String homepage = '$server/home.php';


  ///=========================== Orders ===========================

  static const String approveOrders= '$server/admin/orders/approve.php';
  static const String prepare = '$server/admin/orders/prepare.php';

  static const String viewarchiveOrders = '$server/admin/orders/archive.php';
  static const String viewpendingOrders = '$server/admin/orders/viewpending.php';
  static const String viewacceptedOrders = '$server/admin/orders/viewaccepted.php';
  static const String detailsOrders= 'https://pckodstore.com/ecommerce/orders/details.php';



  ///=========================== Categories ===========================

  static const String categoriesview = '$server/admin/categories/view.php';
  static const String categoriesadd = '$server/admin/categories/add.php';
  static const String categoriesedit= '$server/admin/categories/edit.php';
  static const String categoriesdelete = '$server/admin/categories/delete.php';



  ///=========================== Items ===========================

  static const String itemsview = '$server/admin/items/view.php';
  static const String itemsadd = '$server/admin/items/add.php';
  static const String itemsedit= '$server/admin/items/edit.php';
  static const String itemsdelete = '$server/admin/items/delete.php';

}
