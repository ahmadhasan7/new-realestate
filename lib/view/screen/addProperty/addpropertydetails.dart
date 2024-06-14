import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/view/widget/addproperty/coustombuttombar.dart';
import 'package:realestate/view/widget/addproperty/coustompanner.dart';
import 'package:realestate/view/widget/addproperty/coustomradiobuttom.dart';

import '../../../controller/addPropertyController.dart';
import '../../../core/constanat/colors.dart';
import 'addpropertytext.dart';
import 'dropdownproperty.dart';

class AddPropertyDetails extends StatelessWidget {
  const AddPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    AddPropertyController controller = Get.put(AddPropertyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "المعلومات الأساسية",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Tejwalold",
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.greencolor,
        centerTitle: true,
      ),
      body: GetBuilder<AddPropertyController>(builder: (controller) {
        return Container(
              decoration:const  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Assets/images/12.jpg"),
                  // Set your background image here
                  fit: BoxFit.cover,
                ),
              ),
          child: SingleChildScrollView(
              child: Column(children: [
            CoustomPanner(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CoustomRedioButton(
                  val: "آجار",
                  groupval: controller.stutus,
                  onchanged: (val) {
                    controller.changestutus(val);
                  },
                ),
                CoustomRedioButton(
                  val: "بيع",
                  groupval: controller.stutus,
                  onchanged: (val) {
                    controller.changestutus(val);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DropDownProperty(
                    items: controller.tybeOfProperty,
                    onchanged: (String? val) {
                      controller.tybeOfPropertyupdate(val!);
                    },
                    value: controller.tybeOfPropertyselected,
                    nameofitem: 'نوع العقار',
                    ireq: true,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  controller.changeitems
                      ? AddPropertyText(
                          nameofitem: 'السعر',
                          isreq: true,
                          controller: controller.price,
                        )
                      : AddPropertyText(
                          nameofitem: 'الاجار',
                          isreq: true,
                          controller: controller.price,
                        ),
                  AddPropertyText(
                    nameofitem: 'المساحة',
                    isreq: true,
                    controller: controller.size,
                  ),
                  DropDownProperty(
                    items: controller.floor,
                    onchanged: (String? val) {
                      controller.floorupdate(val!);
                    },
                    value: controller.floorselected,
                    nameofitem: 'رقم الطابق',
                    ireq: true,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  DropDownProperty(
                    items: controller.prpertyFounder,
                    onchanged: (String? val) {
                      controller.prpertyFounderupdate(val!);
                    },
                    value: controller.prpertyFounderselected,
                    nameofitem: 'نوع الملكية',
                    ireq: true,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  AddPropertyText(
                    nameofitem: 'عدد الغرف',
                    isreq: true,
                    controller: controller.numOfRoom,
                  ),
                  controller.changeitems
                      ? DropDownProperty(
                          items: controller.Ownertype,
                          onchanged: (String? val) {
                            controller.Ownertypeupdate(val!);
                          },
                          value: controller.Ownertypeselected,
                          nameofitem: 'نوع البائع',
                          ireq: true,
                        )
                      : DropDownProperty(
                          items: controller.Rentalperiod,
                          onchanged: (String? val) {
                            controller.Ownertypeupdate(val!);
                          },
                          value: controller.Rentalperiodselected,
                          nameofitem: 'طبيعة الاجار',
                          ireq: true,
                        ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  DropDownProperty(
                    items: controller.cladding,
                    onchanged: (String? val) {
                      controller.claddingupdate(val!);
                    },
                    value: controller.claddingselected,
                    nameofitem: 'الفرش',
                    ireq: true,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  DropDownProperty(
                    items: controller.direction,
                    onchanged: (String? val) {
                      controller.directionupdate(val!);
                    },
                    value: controller.directionselected,
                    nameofitem: 'الاتجاه',
                    ireq: true,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  DropDownProperty(
                    items: controller.condition,
                    onchanged: (String? val) {
                      controller.conditionupdate(val!);
                    },
                    value: controller.conditionselected,
                    nameofitem: 'الإكساء',
                    ireq: false,
                  ),
                  SizedBox(
                    height: 10.sp,
                  ),
                  DropDownProperty(
                    items: controller.location,
                    onchanged: (String? val) {
                      controller.locationupdate(val!);
                    },
                    value: controller.locationselected,
                    nameofitem: 'الموقع',
                    ireq: true,
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 125.sp,
                          child: Text(
                            "الوصف",
                            style: TextStyle(
                                fontFamily: "Tejwal",
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp),
                            textAlign: TextAlign.end,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 50),
                          width: 5.sp,
                          child: Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    controller: controller.description,
                    maxLines: 5,
                    decoration:const  InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'اترك وصف عقارك هنا',
                    ),
                  ),
                  SizedBox(
                    height: 20.sp,
                  ),
                  CoustomButtomBar(onPressednext: () {controller.gotonextscreen();}, onPressedremove: () {})
                ],
              ),
            ),
          ])),
        );
      }),
    );
  }
}
