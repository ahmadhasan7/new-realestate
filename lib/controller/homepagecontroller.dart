import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:realestate/controller/personal_info_controller.dart';
import 'package:realestate/view/screen/mainpagescreen.dart';
import 'package:realestate/view/screen/userproperty/userproperty.dart';

import '../core/functions/notification.dart';
import '../view/screen/addProperty/addPropertyPhoto.dart';

abstract class HomePageController extends GetxController {}

class HomePageControllerImp extends HomePageController {
  int page = 0;
  List<Widget> pages = [
    const MainPageScreen(),
  const  Center(
      child: Text("HomePage"),
    ),
    const UserProperty(),
    const AddProperyPhotos(),
  ];

  onpress(int index) {
    page = index;
    update();
  }

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  void onInit() {
    Get.put(PersonalInfoController());
    fcmconfig();
    notificationPermissinn();
    super.onInit();
  }
}
