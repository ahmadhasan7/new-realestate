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
  List<PropertyModel> data = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  String? kind;

  @override
  void onInit() {
    kind = Get.arguments;
    initialData();
    print(kind);
    super.onInit();
  }

  initialData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyData.getPropertyData(
        kind!,myServices.pref.getString('token')!);
    statusRequest = handlingData(response);
    print(myServices.pref.getString('token')!);

    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      print("000000000000000000000000000000000000000");
      print(response[0]["is_favorite"]);
      print(response[1]["is_favorite"]);
      print("000000000000000000000000000000000000000");
        data =
            (response as List).map((item) => PropertyModel.fromJson(item)).toList();

      update();
    }
  }
  goToPropertyDetails(String slug){
    Get.toNamed(AppRoute.propertdetailsscreen,arguments:slug);
  }
}
