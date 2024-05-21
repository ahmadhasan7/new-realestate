import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import '../data/static/onbordring.dart';
abstract class OnBordingController extends GetxController {
  next();
  onpagechange(int m);
}
class OnBordingControll extends OnBordingController{
  int currentindex=0;
  late PageController pageController;
  @override
  next() {
    currentindex++;
    if(currentindex<data.length){
      pageController.animateToPage(currentindex, duration:Duration(seconds: 1), curve: Curves.easeOutBack);
    }
    else {
      Get.toNamed(AppRoute.signin);
    }
    update();
  }

  @override
  onpagechange(int index) {
    currentindex=index;
    update();
  }
  @override
  void onInit() {
    pageController=PageController();
    super.onInit();
  }
}