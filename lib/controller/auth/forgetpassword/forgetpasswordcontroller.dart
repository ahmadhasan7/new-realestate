import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';

import '../../../core/class/stutusconntection.dart';
import '../../../core/functions/handingdatacontroller.dart';
import '../../../core/services/services.dart';
import 'package:get/get.dart';
abstract class ForgetPasswordController extends GetxController{
  ForgetPassword();
}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  late TextEditingController phone;
  String?id;
  MyServices services=Get.find();
  StatusRequest statusRequest=StatusRequest.none;
  @override
  ForgetPassword() async{
Get.toNamed(AppRoute.verifycodeforgetpasswors);
    }

  @override
  void onInit() {
  phone=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }
}