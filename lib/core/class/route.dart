import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/core/middleware/mymiddleware.dart';
import 'package:realestate/data/models/personal_info_model.dart';
import 'package:realestate/view/screen/about_us.dart';
import 'package:realestate/view/screen/coustomize_search.dart';
import 'package:realestate/view/screen/detailsscreen.dart';
import 'package:realestate/view/screen/favorite_screen.dart';
import 'package:realestate/view/screen/filteres/filtered_property_screen.dart';
import 'package:realestate/view/screen/filteres/filtered_search_screen.dart';
import 'package:realestate/view/screen/homepage.dart';
import 'package:realestate/view/screen/personal_info_screen.dart';
import 'package:realestate/view/screen/setting.dart';
import 'package:realestate/view/screen/spesial_search_screen.dart';
import 'package:realestate/view/screen/userproperty/update_user_proprty.dart';
import 'package:realestate/view/screen/userproperty/userproperty.dart';

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
import '../../view/screen/userproperty/userpropertydetails.dart';

class Routers {
  List<GetPage<dynamic>>? routers = [
     GetPage(
         name:'/',
         page: () => const OnBordringScreen(),
         middlewares: [MyMiddleWare()]),
    GetPage(name: AppRoute.homepage, page: () => const HomePage()),
    GetPage(name: AppRoute.detailsscreeen, page: () => const DetailsScreen()),
    GetPage(name: AppRoute.signin, page: () => const SignIn()),
    GetPage(name: AppRoute.signup, page: () => const SignUp()),
    GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
    GetPage(
        name: AppRoute.verifycodeforgetpasswors,
        page: () => const VerifycodeForgetPassword()),
    GetPage(
        name: AppRoute.resetpassword, page: () => const ResetPasswordScreen()),
    GetPage(
        name: AppRoute.verifycodesignup, page: () => const VerifyCodeSignup()),
    GetPage(
        name: AppRoute.AddCoustomerData, page: () => const AddCoustomerData()),
    GetPage(
        name: AppRoute.propertdetailsscreen,
        page: () => const PropertyDetailsScreen()),
    GetPage(
        name: AppRoute.AddPropertyDetails,
        page: () => const AddPropertyDetails()),
   // GetPage(name: AppRoute.setting, page: () => const SettingPage()),
    GetPage(
        name: AppRoute.personalinfo, page: () => const PersonalInfoScreen()),
    GetPage(name: AppRoute.aboutus, page: () => AboutUsScreen()),
    GetPage(name: AppRoute.userproperty, page: () => const UserProperty(

    )),
    GetPage(name: AppRoute.updateuserproprty, page: ()=>const UpdateUserProprty())

    ,GetPage(name: AppRoute.userpropertydetails, page: ()=>const UserPropertyScreen())
    ,GetPage(name: AppRoute.coustomizesearsh, page: ()=>const CoustomizeSearch()),
    GetPage(name: AppRoute.spicealsearch, page: ()=>const SpicialSearchScreen()),
    GetPage(name: AppRoute.favorite, page: ()=>const FavoriteScreen()),
    GetPage(name: AppRoute.coustomizesearsh, page: ()=>const CoustomizeSearch()),
    GetPage(name: AppRoute.filteredsearch, page: ()=>const FilteredSearch()),
    GetPage(name: AppRoute.filteredpropertysearch, page: ()=>const FilteredPropertyScreen())

  ];
}
