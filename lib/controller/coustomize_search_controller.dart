import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/core/services/services.dart';
class CoustomizeSearchController extends GetxController{
  MyServices myServices=Get.find();
  var showWidget = true.obs;

  @override
  void onInit() {
    super.onInit();
    _checkFirstUse();
  }

  Future<void> _checkFirstUse() async {
        bool? isFirstUse = myServices.pref.getBool('ISFirstUse');
    if (isFirstUse != null && !isFirstUse) {
      showWidget.value = false;
    }
  }

  Future<void> dismissWidget() async {
    await myServices.pref.setBool('ISFirstUse', false);
    showWidget.value = false;
  }
  goToselectSearchscreen(){
    Get.toNamed(AppRoute.spicealsearch);

  }
}