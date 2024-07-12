import 'package:get/get.dart';
import 'package:realestate/core/class/stutusconntection.dart';
import 'package:realestate/data/models/personal_info_model.dart';
import 'package:realestate/data/remote/personal_info_data.dart';

import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';

class PersonalInfoController extends GetxController {
  PersonalInfoData personalInfoData = PersonalInfoData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  PersonalInfoModel? data;

  getdetailsforproperty() async {
    print("00000000000000000000");
    update();
    var response = await personalInfoData
        .getPersonalIngo("d8e80cb927b0fc9164e4bc0a71686a4054d41be5");
    statusRequest = handlingData(response);
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      if (response is Map<String, dynamic>) {
        data = PersonalInfoModel.fromJson(response['profile']);
        print(data);
      }
    }
  }
  @override
  void onInit() {
    getdetailsforproperty();
    super.onInit();
  }
}
