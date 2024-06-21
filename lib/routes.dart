import 'package:fujika_ecommerce/core/constant/routes.dart';
import 'package:fujika_ecommerce/core/mymiddleware/middleware.dart';
import 'package:fujika_ecommerce/view/profile.dart';
import 'package:fujika_ecommerce/view/screen/address/add.dart';
import 'package:fujika_ecommerce/view/screen/address/adddetails.dart';
import 'package:fujika_ecommerce/view/screen/address/view.dart';
import 'package:fujika_ecommerce/view/screen/checkout.dart';
import 'package:fujika_ecommerce/view/screen/forgetpass/forgetpassword.dart';
import 'package:fujika_ecommerce/view/screen/Auth/login.dart';
import 'package:fujika_ecommerce/view/screen/forgetpass/resetpassword.dart';
import 'package:fujika_ecommerce/view/screen/Auth/signup.dart';
import 'package:fujika_ecommerce/view/screen/forgetpass/successresetpass.dart';
import 'package:fujika_ecommerce/view/screen/Auth/successsignUp.dart';
import 'package:fujika_ecommerce/view/screen/Auth/verifypassword.dart';
import 'package:fujika_ecommerce/view/screen/Auth/verifysignupcode.dart';
import 'package:fujika_ecommerce/view/screen/cart.dart';
import 'package:fujika_ecommerce/view/screen/homescreen.dart';
import 'package:fujika_ecommerce/view/screen/items.dart';
import 'package:fujika_ecommerce/view/screen/language.dart';
import 'package:fujika_ecommerce/view/screen/myfavorite.dart';
import 'package:fujika_ecommerce/view/screen/notification.dart';
import 'package:fujika_ecommerce/view/screen/onbording.dart';
import 'package:fujika_ecommerce/view/screen/orders/archive.dart';
import 'package:fujika_ecommerce/view/screen/orders/details.dart';
import 'package:fujika_ecommerce/view/screen/orders/pending.dart';
import 'package:fujika_ecommerce/view/screen/productdetails.dart';
import 'package:fujika_ecommerce/view/screen/setting/language.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleware()]),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.cart, page: () => const Profile()),

  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),

  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPass()),
  GetPage(name: AppRoute.verfiyCodeSignUp, page: () => const VerifySignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBording()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),

  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),

  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
  GetPage(name: AppRoute.notification, page: () => const NotificationView()),

  GetPage(name: AppRoute.addressview, page: () => const AddressView()),

  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),

  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.localization, page: () => const Language1()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),

  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),

  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.offers, page: () => const OrdersDetails()),

  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
];
