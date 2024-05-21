import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constanat/routing.dart';
import '../services/services.dart';
class MyMiddleWare extends GetMiddleware{
  MyServices myServices=Get.find();
  int get  priority => 1;
  RouteSettings? redirect(String? route) {
    if(myServices.pref.getString("login")=="1"){
      return RouteSettings(name:AppRoute.homepage);
    }
  }


}