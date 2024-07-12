import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/core/services/services.dart';
class SettingController extends GetxController{
  MyServices myServices=Get.find();
  logout(){
    myServices.pref!.clear();
    Get.offAllNamed(AppRoute.signin);
  }
}