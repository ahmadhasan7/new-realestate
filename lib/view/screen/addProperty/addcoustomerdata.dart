import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:realestate/core/class/handlingrequstveiw.dart';
import 'package:realestate/view/widget/addproperty/coustomtextfeild.dart';
import 'package:realestate/view/widget/addproperty/coustombuttombar.dart';
import 'package:get/get.dart';
import '../../../controller/addPropertyController.dart';
import '../../../core/constanat/colors.dart';

class AddCoustomerData extends StatelessWidget {
  const AddCoustomerData({super.key});

  @override
  Widget build(BuildContext context) {
    AddPropertyController controller = Get.put(AddPropertyController());
    return Scaffold(
        bottomNavigationBar: CoustomButtomBar(
          onPressednext: () {
            controller.uplodeAllDetails();
          },
          onPressedremove: () {},
        ),
        appBar: AppBar(
          title: const Text(
            "تفاصيل المالك",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Tejwalold",
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.greencolor,
          centerTitle: true,
        ),
        body: GetBuilder<AddPropertyController>(builder: (controller){
          return CoustomHandlingData(statusRequest: controller.statusRequest, widget: Container(
            decoration:const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("Assets/images/12.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "  رقم المالك  ",
                        style: TextStyle(fontFamily: "Tejwal", fontSize: 20.sp),
                      ),
                      const Icon(
                        Icons.phone,
                        color: AppColors.greencolor,
                      )
                    ],
                  ),
                  CoustomTextFieldProperty(
                    hinttext: "ادخل رقم الهاتف",
                    mycontroller: controller.userPhone,
                    valid: (String) {},
                    isNumber: true,
                    width: 350.sp,
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "  الأوقات المتاحة للاتصال  ",
                        style: TextStyle(fontFamily: "Tejwal", fontSize: 20.sp),
                      ),
                      const  Icon(
                        Icons.access_time_filled,
                        color: AppColors.greencolor,
                      )
                    ],
                  ),
                  const Text(
                    "يمكنك إضافة الأوقات المناسبة لك بشكل اختياري   ",
                    style: TextStyle(color: Colors.grey, fontFamily: "Tejwal"),
                  ),
                  CoustomTextFieldProperty(
                    hinttext: "ادخل الأوقات",
                    mycontroller: controller.Dateuser,
                    valid: (String) {},
                    isNumber: true,
                    width: 350.sp,
                  ),
                ],
              ),
            ),
          ),
          );
        },));
  }
}
