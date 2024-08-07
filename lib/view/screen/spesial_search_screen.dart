import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/spisial_search_controller.dart';
import '../../core/constanat/colors.dart';
import '../widget/addproperty/coustomradiobuttom.dart';
import '../widget/addproperty/dropdownproperty.dart';
class SpicialSearchScreen extends StatelessWidget {
  const SpicialSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SpicialSearchController controller=Get.put(SpicialSearchController());
    return Scaffold(
        appBar: AppBar(
        backgroundColor:AppColors.greencolor,
        title: const Text(
        "بماذا تهتم",
        style: TextStyle(
        color: Colors.white,
        fontFamily: "Tejwal",
    ),
    ),
    centerTitle: true,
    ),
      body: GetBuilder<SpicialSearchController>(builder:
        (controller){ return  Column(
          children: [
            Image.asset("Assets/images/123333.PNG"),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoustomRedioButton(
                  val: "للأجار",
                  groupval: controller.stutus,
                  onchanged: (val) {
                    controller.changestutus(val);
                  }, title: 'اجار',
                ),
                CoustomRedioButton(
                  val: "للبيع",
                  groupval: controller.stutus,
                  onchanged: (val) {
                    controller.changestutus(val);
                  }, title: 'بيع',
                ),
              ],
            ),
            DropDownProperty(
              items: controller.items.tybeOfProperty,
              onchanged: (String? val) {
                controller.tybeOfPropertyupdate(val!);
              },
              value: controller.tybeOfPropertyselected,
              nameofitem: 'نوع العقار',
              ireq: true,
            ),
            SizedBox(height: 14.sp,),
            DropDownProperty(
              items: controller.items.location,
              onchanged: (String? val) {
                controller.locationupdate(val!);
              },
              value: controller.locationselected,
              nameofitem: 'الموقع',
              ireq: true,
            ),
            ElevatedButton(onPressed: (){controller.sentnoti();}, child: Padding(padding: EdgeInsets.all(10.sp),child: Text("تمت"),))
          ],
        );}
      ),
    );
  }
}
