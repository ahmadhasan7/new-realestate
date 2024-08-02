import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/setting_controller.dart';
import 'package:realestate/view/widget/setting/coustom_setting_text.dart';

import '../../controller/personal_info_controller.dart';
import '../../core/constanat/colors.dart';
import '../widget/setting/coustom_card_setting.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.put(SettingController());
    return Scaffold(
      body: ListView(
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(height: Get.width / 3, color: AppColors.greencolor),
                  Positioned(
                      top: Get.width / 5,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.grey[100],
                          backgroundImage:
                              AssetImage("Assets/images/unnamed.jpg"),
                        ),
                      )),
                ]),
            SizedBox(height: 150.h),
            const CoustomTextSetting(title: "الملف الشخصي"),
            SizedBox(
              height: 15.h,
            ),
            CustomCardSetting(
              items: [
                {
                  'onTap': () {},
                  'title': "المعلومات الشخصية",
                  'trailingIcon': Icons.perm_identity_sharp,
                },
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const CoustomTextSetting(title: "التطبيق"),
            SizedBox(
              height: 15.h,
            ),
            CustomCardSetting(
              items: [
                {
                  'onTap': () {},
                  'title': "الاشعارات",
                  'trailingIcon': Icons.notification_add_outlined,
                },
                {
                  'onTap': () {},
                  'title': "اللغات",
                  'trailingIcon': Icons.language,
                },
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const CoustomTextSetting(title: "اخر"),
            SizedBox(
              height: 15.h,
            ),
            CustomCardSetting(
              items: [
                {
                  'onTap': () {},
                  'title': "مشاركة التطبيق",
                  'trailingIcon': Icons.share,
                },
                {
                  'onTap': () {},
                  'title': "اصدار التطبيق",
                  'trailingIcon': Icons.vertical_align_bottom,
                },
                {
                  'onTap': () {},
                  'title': "من نحن؟",
                  'trailingIcon': Icons.question_mark,
                },
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            const CoustomTextSetting(title: "خيارات اخرى"),
            SizedBox(
              height: 15.h,
            ),
            CustomCardSetting(
              items: [
                {
                  'onTap': (){settingController.logout();},
                  'title': "تسجيل الخروج",
                  'trailingIcon': Icons.login,
                },
              ],
            ),
          ],
        ),

    );
  }
}
