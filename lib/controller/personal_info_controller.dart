import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/class/stutusconntection.dart';
import 'package:realestate/data/models/personal_info_model.dart';
import 'package:realestate/data/remote/personal_info_data.dart';

import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/remote/edit_profile_data.dart';

class PersonalInfoController extends GetxController {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  EditProfileData editProfileData = EditProfileData(Get.find());
  PersonalInfoData personalInfoData = PersonalInfoData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  PersonalInfoModel? data;
  late TextEditingController name;
  late TextEditingController pass;
  late TextEditingController gender;
  late TextEditingController about;
  late TextEditingController phone;
  late TextEditingController city;
  late TextEditingController email;
  defultDialog(String title, String subtitle, Widget content, TextEditingController controller, String key) {
    Get.defaultDialog(
        title: subtitle,
        content: content,
        textCancel: "الغاء",
        textConfirm: "تأكيد",
        onConfirm: () {
          Get.back();
          updateData(key, controller.text);
        }
    );
  }

  getdetailsforproperty() async {
    var response = await personalInfoData
        .getPersonalIngo(myServices.pref.getString('token')!);
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.seccess) {
      if (response is Map<String, dynamic>) {
        data = PersonalInfoModel.fromJson(response['profile']);
      }
    }
  }

  updateData(String key, String value) async {

    Get.snackbar("جاري تعديل طلبك", "سيتم ابلغك عند الانتهاء");
    update();
    var response = await editProfileData.PatchProfiledata(
        key, value, myServices.pref!.getString('token')!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.seccess) {
      Get.back();
      Get.snackbar("تم التعديل", "تم تعديل بيانات بنجاح");
      switch (key) {
        case 'fullName':
          data!.fullName = value;
          break;
        case 'user.password':
          break;
        case 'phone_number':
          data!.phoneNumber = value;
          break;
        case 'about_me':
          data!.aboutMe = value;
          break;
      }
      update();
    }
    else{
      Get.snackbar("خطأ", "حدث خطأ غير متوقع اعد المحاولة لاحقاً");
      update();

    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    pass = TextEditingController();
    about = TextEditingController();
    phone = TextEditingController();
    gender = TextEditingController();
    city=TextEditingController();
    email=TextEditingController();
    getdetailsforproperty();
    super.onInit();
  }

  @override
  void dispose() {
    city.dispose();
    email.dispose();
    name.dispose();
    pass.dispose();
    about.dispose();
    phone.dispose();
    gender.dispose();
    super.dispose();
  }
}
