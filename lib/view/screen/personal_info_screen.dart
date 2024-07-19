import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/personal_info_controller.dart';
import 'package:realestate/data/static/onbordring.dart';

import '../../core/constanat/colors.dart';
import '../widget/personal_info/coustom_listtile.dart';
import '../widget/personal_info/coustom_text_field.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PersonalInfoController controller = Get.find();
    print(controller.data!.city);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greencolor,
        title: Text(
          "المعلومات الشخصية",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body:GetBuilder<PersonalInfoController>(builder: (controller){
        return  Form(
          key: controller.key,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CoustomListTile(
                  title: 'اسم المستخدم',
                  subtitle: controller.data!.fullName!,
                  onTap: () {
                    controller.name.text = controller.data!.fullName!;
                    controller.defultDialog(
                        controller.data!.fullName!,
                        "تعديل اسم المستخدم",
                        CoustomTextFieldPersonal(
                            controller: controller.name,
                            isnum: false,
                            initval: controller.data!.fullName!),controller.name,'fullName');
                  },
                  iconData: Icons.person,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CoustomListTile(
                  title: 'كلمة المرور',
                  subtitle: "*****************",
                  onTap: () {
                    controller.pass.text = "**************";

                    controller.defultDialog(
                        "",
                        "تعديل كلمة المرور",
                        CoustomTextFieldPersonal(
                            controller: controller.pass,
                            isnum: false,
                            initval: "***************"),controller.pass,'user.password');
                  },
                  iconData: Icons.password,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CoustomListTile(
                  title: 'الايميل الشخصي',
                  subtitle: controller.data!.email!,
                  onTap: () {
                    controller.email.text = controller.data!.email!;
                    controller.defultDialog(
                        controller.data!.email!,
                        "تعديل الايميل",
                        CoustomTextFieldPersonal(
                            controller: controller.email,
                            isnum: false,
                            initval: controller.data!.email!),controller.email,'email');
                  },
                  iconData: Icons.email,
                ),

                SizedBox(
                  height: 5.h,
                ),
                CoustomListTile(
                  title: 'المدينة',
                  subtitle: controller.data!.city!,
                  onTap: () {
                    controller.city.text = controller.data!.city!;
                    controller.defultDialog(
                        controller.data!.city!,
                        "المدينة",
                        CoustomTextFieldPersonal(
                            controller: controller.city,
                            isnum: false,
                            initval: controller.data!.city!),controller.city,'city');
                  },
                  iconData: Icons.location_history,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CoustomListTile(
                  title: 'الجنس',
                  subtitle: "ذكر",
                  onTap: () {},
                  iconData: Icons.gamepad_outlined,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CoustomListTile(
                  title: 'رقم الهاتف',
                  subtitle: controller.data!.phoneNumber!,
                  onTap: () {
                    controller.phone.text = controller.data!.phoneNumber!;

                    controller.defultDialog(
                        controller.data!.phoneNumber!,
                        "تعديل رقم الهاتف",
                        CoustomTextFieldPersonal(
                            controller: controller.phone,
                            isnum: false,
                            initval: controller.data!.phoneNumber!),controller.phone,'phone_number');
                  },
                  iconData: Icons.phone,
                ),
                SizedBox(
                  height: 5.h,
                ),
                CoustomListTile(
                  title: 'حول المستخدم',
                  subtitle: controller.data!.aboutMe!,
                  onTap: () {
                    controller.about.text = controller.data!.aboutMe!;
                    controller.defultDialog(
                        controller.data!.aboutMe!,
                        "تعديل وصف المستخدم",
                        CoustomTextFieldPersonal(
                            controller: controller.about,
                            isnum: false,
                            initval: controller.data!.aboutMe!),controller.about,'about_me');
                  },
                  iconData: Icons.info,
                ),
              ],
            ),
          ),
        );
      },)
    );
  }
}
