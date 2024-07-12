import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/personal_info_controller.dart';
class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PersonalInfoController controller=Get.find();
    print(controller.data!.city);
    return Scaffold(
      body: Column(),
    );
  }
}
