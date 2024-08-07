import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';

class MainScreenController extends GetxController{

  List<String> imageurl=[
    "Assets/images/ard.jpg",
    "Assets/images/bayt.jpg",
    "Assets/images/benaa.jpg",
    "Assets/images/fela.jpg",
    "Assets/images/mahl.jpg",
    "Assets/images/maktab.jpg",
  ];
  gotodetailsscreen(String tybe){

    Get.toNamed(AppRoute.detailsscreeen,arguments: tybe);
  }
  goToCoustomizeScreen(){
    Get.toNamed(AppRoute.coustomizesearsh);
  }
}