import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/colors.dart';

import '../../controller/drawer_controller.dart';


class CoustomDrower extends StatelessWidget {
  const CoustomDrower({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyDrawerController controller=Get.put(MyDrawerController());
    return Drawer(
      child: Container(
        child: ListView(
          children: [
            Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(height: Get.width / 3, color:AppColors.greencolor),
                  Positioned(
                      top: Get.width / 3.9,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey[100],
                          backgroundImage: AssetImage("Assets/images/unnamed.jpg"),

                        ),
                      )),
                ]),
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  ListTile(
                    // onTap: () {},
                    trailing: Switch(onChanged: (val) {}, value: true),
                    title: Text("تمكين الاشعارات",style: TextStyle(fontFamily: "Tejwal")),
                  ),
                  ListTile(
                    onTap: () {
                      controller.goToPersonalInfo();

                    },
                    trailing: const Icon(Icons.settings),
                    title: const Text("المعلومات الشخصية",style: TextStyle(fontFamily: "Tejwal")),
                  ),
                  ListTile(
                    onTap: () {
                      controller.goToAboutUs();
                    },
                    trailing:const Icon(Icons.location_on_outlined),
                    title:const Text("من نحن؟",style: TextStyle(fontFamily: "Tejwal")),
                  ),
                  ListTile(
                    onTap: () {},
                    trailing:const Icon(Icons.help_outline_rounded),
                    title:const Text("ماذا عننا؟",style: TextStyle(fontFamily: "Tejwal")),
                  ),
                  ListTile(
                    onTap: () {},
                    trailing:const Icon(Icons.phone_callback_outlined),
                    title:const Text("تواصل معنا",style: TextStyle(fontFamily: "Tejwal")),
                  ),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title:const Text("تسجيل الخروج",style: TextStyle(fontFamily: "Tejwal"),),
                    trailing:const Icon(Icons.exit_to_app),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}