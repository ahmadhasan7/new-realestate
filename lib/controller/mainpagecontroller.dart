import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/core/services/services.dart';
import 'package:realestate/view/widget/coustom_guest_dialog.dart';

class MainScreenController extends GetxController{
  MyServices myServices=Get.find();
  goToFavScreen(){
    if(myServices.pref!.getString('token')==null){
      showCoustomDialog();
    }
    else{
      Get.toNamed(AppRoute.favorite);
    }
  }
  List<String>category=['فيلا','بناء','شقة','أرض','شاليه','مزرعة','مكتب','محل تجاري'];


  List<String> imageurl=[
    "Assets/images/ard.jpg",
    "Assets/images/bayt.jpg",
    "Assets/images/benaa.jpg",
    "Assets/images/fela.jpg",
    "Assets/images/mahl.jpg",
    "Assets/images/maktab.jpg",
  ];
  gotodetailsscreen(String tybe,List category,int index){

    Get.toNamed(AppRoute.detailsscreeen,arguments: {
      "tybe":tybe,
      "category":category,
      "index":index
    });
  }
  goToCoustomizeScreen(){
    if(myServices.pref!.getString('token')==null){
      showCoustomDialog();
    }
    else{    Get.toNamed(AppRoute.coustomizesearsh);
    }
  }
}