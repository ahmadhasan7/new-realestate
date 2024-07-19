import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../core/constanat/routing.dart';
import '../core/services/services.dart';
class MyDrawerController extends GetxController {
  MyServices myServices = Get.find();


  logout() {
    myServices.pref!.clear();
    Get.offAllNamed(AppRoute.signin);
  }
  goToPersonalInfo(){
    Get.toNamed(AppRoute.personalinfo);
  }
  goToAboutUs(){
    Get.toNamed(AppRoute.aboutus,);
  }
}
