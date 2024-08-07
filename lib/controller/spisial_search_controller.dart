import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';

import '../core/constanat/dropdownitems.dart';
class SpicialSearchController extends GetxController{
  String tybeOfPropertyselected = 'شقة';
  String locationselected = 'دمشق';
  String stutus = "للبيع";
  DropDownItems items = DropDownItems();
  bool changeitems = true;
  void tybeOfPropertyupdate(String? val) {
    tybeOfPropertyselected = val!;
    update();
  }
  void locationupdate(String? val) {
    locationselected = val!;
    update();
  }
  void changestutus(String? val) {
    stutus = val!;
    if (val == "للبيع") {
      changeitems = true;
    } else {
      changeitems = false;
    }
    update();
  }
  sentnoti(){
    String val="${locationselected}-${tybeOfPropertyselected}-${stutus}";
    String encodedString = Uri.encodeComponent(val);
    print(val);
    print(encodedString);
    FirebaseMessaging.instance.subscribeToTopic(encodedString);
    Get.offAndToNamed(AppRoute.homepage);
    Get.snackbar("تمت", "تمت العملية بنجاح");
  }


}