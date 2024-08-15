import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:realestate/controller/personal_info_controller.dart';
import 'package:realestate/core/services/services.dart';
import 'package:realestate/view/screen/favorite_screen.dart';
import 'package:realestate/view/screen/filteres/filtered_search_screen.dart';
import 'package:realestate/view/screen/mainpagescreen.dart';
import 'package:realestate/view/screen/userproperty/userproperty.dart';
import 'package:realestate/view/widget/coustom_guest_dialog.dart';

import '../core/functions/notification.dart';
import '../view/screen/addProperty/addPropertyPhoto.dart';
import 'favorite_controller.dart';

abstract class HomePageController extends GetxController {}

class HomePageControllerImp extends HomePageController {
  MyServices myServices=Get.find();
  FavoriteController favoriteController = Get.put(FavoriteController()); // Initialize the favorite controller
  int page = 0;
  List<Widget> pages = [
    const MainPageScreen(),
  const FavoriteScreen(),
    const UserProperty(),
    const FilteredSearch(),
    const AddProperyPhotos(),
  ];

  onpress(int index) {
    if(myServices!.pref!.getString('token')==null){
      showCoustomDialog();
    }
    else{page = index;
    if (index == 1) {
      favoriteController.getUserFavorite();
    }}

    update();
  }

  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  void onInit() {
    Get.put(PersonalInfoController());
    FirebaseMessaging.instance.getToken().then((value) => print(value));
    fcmconfig();
    notificationPermissinn();
    super.onInit();
  }
}
