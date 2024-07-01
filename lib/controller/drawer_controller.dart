import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import '../core/services/services.dart';
class MyDrawerController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.pref.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.pref.clear();
    //Get.offAllNamed(AppRoute.login);
  }
}
