import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/core/middleware/mymiddleware.dart';
import 'package:realestate/view/screen/detailsscreen.dart';
import 'package:realestate/view/screen/homepage.dart';

import '../../controller/auth/verifycodesignupcontroller.dart';
import '../../view/screen/addProperty/addcoustomerdata.dart';
import '../../view/screen/addProperty/addpropertydetails.dart';
import '../../view/screen/auth/forgetpassword/forgetpassword.dart';
import '../../view/screen/auth/forgetpassword/resetpassword.dart';
import '../../view/screen/auth/forgetpassword/verifycodeforgetpassword.dart';
import '../../view/screen/auth/signin.dart';
import '../../view/screen/auth/signup.dart';
import '../../view/screen/auth/verifycodesignup.dart';
import '../../view/screen/onbording/onbordringscreen.dart';
import '../../view/screen/propertydetailsscreen.dart';

class Routers {
  List<GetPage<dynamic>>? routers = [
    GetPage(
        name: '/',
        page: () => OnBordringScreen(),
        middlewares: [MyMiddleWare()]),
    GetPage(name: AppRoute.homepage, page: () => HomePage()),
    GetPage(name: AppRoute.detailsscreeen, page: () => DetailsScreen()),
    GetPage(name: AppRoute.signin, page: () => SignIn()),
    GetPage(name: AppRoute.signup, page: () => SignUp()),
    GetPage(name: AppRoute.forgetpassword, page: () => ForgetPassword()),
    GetPage(
        name: AppRoute.verifycodeforgetpasswors,
        page: () => VerifycodeForgetPassword()),
    GetPage(name: AppRoute.resetpassword, page: () => ResetPasswordScreen()),
    GetPage(name: AppRoute.verifycodesignup, page: () => VerifyCodeSignup()),
    GetPage(name: AppRoute.AddCoustomerData, page: () => AddCoustomerData()),
    GetPage(
        name: AppRoute.propertdetailsscreen,
        page: () => PropertyDetailsScreen()),
    GetPage(name: AppRoute.AddPropertyDetails, page: () => AddPropertyDetails())
  ];
}
