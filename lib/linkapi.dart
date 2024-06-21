class AppLink {
  //static const String server = "http://192.168.1.73:802/ecommerce"; //lap

  static const String server = "http://192.168.96.127:802/ecommerce"; //phone
  //static const String server = "http://192.168.68.116:802/ecommerce"; //shehab

  static const String imageststatic = "$server/upload";

//========================== Image ============================
  static const String imagestCategories = "$imageststatic/categories";
  static const String imagestItems = "$imageststatic/items";
// =============================================================
//
  static const String test = "$server/test.php";

  static const String notification = "$server/notification.php";
  static const String catview = "$server/categories/view.php";

// ================================= Auth ========================== //

  static const String signupdata = "$server/auth/signup.php";
  static const String logindata = "$server/auth/login.php";
  static const String verifysignupdata = "$server/auth/verfiycode.php";
  static const String resend = "$server/auth/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetpass = "$server/forgetpassword/resetpassword.php";
  static const String forgetverifycode =
      "$server/forgetpassword/verifycode.php";

// Home

  static const String homepage = "$server/home.php";
// items
  static const String items = "$server/items/items.php";
  static const String searchitems = "$server/items/search.php";

// Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletefromfavroite.php";

  // Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // Coupon

  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  // Checkout
  static const String ordersarchive = "$server/orders/archive.php";
  static const String checkout = "$server/orders/checkout.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String pendingorders = "$server/orders/pending.php";
  static const String offers = "$server/offers.php";

  static const String rating = "$server/rating.php";
}
