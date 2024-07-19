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
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyData.getPropertyData(
        kind!, Staticdata.token!);
    statusRequest = handlingData(response);
    print("0000000000000000000000000000");
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
        data =
            (response as List).map((item) => PropertyModel.fromJson(item)).toList();
        print(data);

      update();
    }
  }
  goToPropertyDetails(String slug){
    Get.toNamed(AppRoute.propertdetailsscreen,arguments:slug);
  }
}
