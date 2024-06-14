import 'package:get/get.dart';
import '../core/class/stutusconntection.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/functions/urlluncher.dart';
import '../core/services/services.dart';
import '../data/models/get_one_property.dart';
import '../data/remote/on_propery_data.dart';
class PropertyDetailsController extends GetxController {
  OnePropertyData propertyData = OnePropertyData(Get.find());
  GetOneProperty? data;
  MyServices myServices = Get.find();
   StatusRequest statusRequest=StatusRequest.loading;
  String? slug;

  getdetailsforproperty() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyData.getPropertyData(
        slug!, myServices.pref!.getString('token')!);
    statusRequest = handlingData(response);
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      if (response is Map<String, dynamic>) {
        data = GetOneProperty.fromJson(response);
      }
      print(data);
      print(data!.furnishing!);
      update();
    }
    update();
  }
  callwithphone(String phone){
    lunchurl("tel:$phone");
  }


  @override
  void onInit()async {
    slug = Get.arguments;
    await getdetailsforproperty();
    super.onInit();
  }
}
