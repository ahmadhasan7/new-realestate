import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/core/constanat/staticdata.dart';
import 'package:realestate/data/remote/propertydata.dart';
import '../../core/class/stutusconntection.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/models/propertymodel.dart';

class DetailsController extends GetxController {

  PropertyData propertyData = PropertyData(Get.find());
  List<String> category=[];
  int index=0;
  List<PropertyModel> data = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  String? kind;
  changePart(int val,String currectpart) {
    index=val;
    kind=currectpart;
    initialData();
    update();
  }

  @override
  void onInit() {
    kind = Get.arguments['tybe'];
    index=Get.arguments['index'];
    category=Get.arguments['category'];
    initialData();
    print(kind);
    super.onInit();
  }
goToCoustomizeSearchScreen(){
    Get.toNamed(AppRoute.filteredsearch);
}
  initialData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyData.getPropertyData(
        kind!);
    statusRequest = handlingData(response);

    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
        data =
            (response as List).map((item) => PropertyModel.fromJson(item)).toList();

      update();
    }
  }
  goToPropertyDetails(String slug){
    Get.toNamed(AppRoute.propertdetailsscreen,arguments:slug);
  }
}
