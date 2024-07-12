import 'package:get/get.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/data/remote/user_property-data.dart';
import '../core/class/stutusconntection.dart';
import '../core/constanat/staticdata.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/models/propertymodel.dart';

class UserPropertyController extends GetxController {
  UserPropertyData userPropertyData = UserPropertyData(Get.find());
  MyServices myServices = Get.find();

  List<PropertyModel> data = [];
  late StatusRequest statusRequest;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await userPropertyData.getPropertyData(Staticdata.token!);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      if (response is List) {
        data = response.map((item) => PropertyModel.fromJson(item)).toList();
      }
    }
    update();
  }

  void goToDetailsProperty(PropertyModel data) {
    Get.toNamed(AppRoute.userpropertydetails, arguments: data);
  }
}