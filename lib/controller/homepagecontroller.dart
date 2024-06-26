import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:realestate/view/screen/mainpagescreen.dart';

import '../core/functions/notification.dart';
import '../view/screen/addProperty/addPropertyPhoto.dart';


abstract class HomePageController extends GetxController {}

class HomePageControllerImp extends HomePageController {
  int page = 0;
  List<Widget> pages=[
MainPageScreen(),
    Center(child: Text("HomePage"),),
    Center(child: Text("HomePage"),),
    AddProperyPhotos(),
  ];
  onpress(int index) {
    page = index;
    update();
  }

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  @override
  void onInit() {
    fcmconfig();
    notificationPermissinn();
    super.onInit();
  }
}
