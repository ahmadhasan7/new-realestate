import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/core/class/handlingrequstveiw.dart';

import '../../../controller/userProprty/update_user_property_contoller.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/addproperty/addpropertytext.dart';
import '../../widget/addproperty/coustombuttomaditionalfuture.dart';
import '../../widget/addproperty/coustombuttombar.dart';
import '../../widget/addproperty/coustompanner.dart';
import '../../widget/addproperty/coustomphotocard.dart';
import '../../widget/addproperty/coustomradiobuttom.dart';
import '../../widget/addproperty/dropdownproperty.dart';
class UpdateUserProprty extends StatelessWidget {
  const UpdateUserProprty({super.key});

  @override
  Widget build(BuildContext context) {
    UpdateUserPropertyController controller =Get.put(UpdateUserPropertyController());
    return Scaffold(
      appBar: AppBar(title: Text("تعديل العقار"),),
      body:GetBuilder<UpdateUserPropertyController>(builder: (controller){
        return CoustomDotedHandlingData(statusRequest: controller.statusRequest, widget:Form(
          key: controller.propertydetailsKey,
          child: SingleChildScrollView(
              child: Column(children: [
                CoustomPanner(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoustomRedioButton(
                      val: "للاجار",
                      groupval: controller.stutus,
                      onchanged: (val) {
                        controller.changestutus(val);
                      }, title: 'للاجار',
                    ),
                    CoustomRedioButton(
                      val: "للبيع",
                      groupval: controller.stutus,
                      onchanged: (val) {
                        controller.changestutus(val);
                      }, title: 'للبيع',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.pickImages();
                            },
                            child: controller.imgFile != null
                                ? Container(
                              padding: EdgeInsets.all(5),
                              width: 100.w,
                              height: 100.h,
                              child: Image.file(
                                controller.imgFile!,
                                fit: BoxFit.cover,
                              ),
                            )
                                : Container(
                              width: 100.w,
                              height: 100.h,
                              child: CoustomPhotoCardUpdate(imageurl: controller.data.coverPhoto!,),
                            ),
                          ),
                          Text(
                            "أختر صورة رئيسية لعقارك",
                            style: TextStyle(fontFamily: "Tejwal", fontSize: 15.sp),
                          ),
                        ],
                      ),
                      DropDownProperty(
                        items: controller.items.tybeOfProperty,
                        onchanged: (String? val) {
                          controller.updateTybe(val!, controller.tybeOfPropertyselected);
                        },
                        value: controller.tybeOfPropertyselected,
                        nameofitem: 'نوع العقار',
                        ireq: true,
                      ),
                      SizedBox(height: 14.sp,),

                      AddPropertyText(
                        dataText: controller.data.title!,
                        nameofitem: 'اسم العقار',
                        isreq: true,
                        controller: controller.title,
                        isnum: false, valid: (String? val ) {
                        return validInput(val!, 3, 10, "type");
                      },
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      controller.changeitems
                          ? AddPropertyText(
                        dataText: "${controller.data.price}",
                        nameofitem: 'السعر',
                        isreq: true,
                        controller: controller.price,
                        isnum: true,
                        valid: (String? val ) {
                          return validInput(val!, 3, 15, "type");
                        },
                      )
                          : AddPropertyText(
                        dataText: "",
                        isnum: true,
                        nameofitem: 'الاجار',
                        isreq: true,
                        controller: controller.price,
                        valid: (String? val ) {
                          return validInput(val!, 3, 15, "type");
                        },
                      ),
                      AddPropertyText(
                        dataText:controller.data.plotArea,
                        isnum: true,
                        nameofitem: 'المساحة',
                        isreq: true,
                        controller: controller.size,
                        valid: (String? val ) {
                          return validInput(val!, 3, 6, "type");
                        },
                      ),
                      DropDownProperty(
                        items: controller.items.floor,
                        onchanged: (String? val) {
                          controller.updateTybe(val!,controller.floorselected);
                        },
                        value: controller.floorselected,
                        nameofitem: 'رقم الطابق',
                        ireq: true,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      // DropDownProperty(
                      //   items: controller.items.prpertyFounder,
                      //   onchanged: (String? val) {
                      //     controller.updateTybe(val!,controller.prpertyFounderselected);
                      //   },
                      //   value: controller.prpertyFounderselected,
                      //   nameofitem: 'نوع الملكية',
                      //   ireq: true,
                      // ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      AddPropertyText(
                        dataText: "${controller.data.totalRooms}",
                        isnum: true,
                        nameofitem: 'عدد الغرف',
                        isreq: true,
                        controller: controller.numOfRoom,
                        valid: (String? val ) {
                          return validInput(val!, 1, 2, "type");
                        },
                      ),
                      AddPropertyText(
                        dataText: "${controller.data.bedrooms}",
                        isnum: true,
                        nameofitem: 'عدد غرف النوم',
                        isreq: true,
                        controller: controller.bedroom,
                        valid: (String? val ) {
                          return validInput(val!, 1, 2, "type");
                        },
                      ),
                      AddPropertyText(
                        dataText: "${controller.data.livingRooms}",

                        isnum: true,
                        nameofitem: 'عدد غرف السكن',
                        isreq: true,
                        controller: controller.livingroom,
                        valid: (String? val ) {
                          return validInput(val!, 1, 2, "type");
                        },
                      ),
                      AddPropertyText(
                        dataText: "${controller.data.kitchens}",

                        isnum: true,
                        nameofitem: 'عدد المطابخ',
                        isreq: true,
                        controller: controller.kitchin,
                        valid: (String? val ) {
                          return validInput(val!, 1, 2, "type");
                        },
                      ),
                      AddPropertyText(
                        dataText: "",

                        isnum: true,
                        nameofitem: 'عدد الحمامات',
                        isreq: true,
                        controller: controller.bathroom,
                        valid: (String? val ) {
                          return validInput(val!, 1, 2, "type");
                        },
                      ),
                      AddPropertyText(
                        dataText: "${controller.data.floorNumber}",
                        isnum: true,
                        nameofitem: 'رقم العقار',
                        isreq: true,
                        controller: controller.numofproperty,
                        valid: (String? val ) {
                          return validInput(val!, 1, 2, "type");
                        },
                      ),
                      controller.changeitems
                          ? DropDownProperty(
                        items: controller.items.Ownertype,
                        onchanged: (String? val) {
                          controller.updateTybe(val!,controller.Ownertypeselected);
                        },
                        value: controller.Ownertypeselected,
                        nameofitem: 'نوع البائع',
                        ireq: true,
                      )
                          : DropDownProperty(
                        items: controller.items.Rentalperiod,
                        onchanged: (String? val) {
                          controller.updateTybe(val!,controller.conditionselected);
                        },
                        value: controller.Rentalperiodselected,
                        nameofitem: 'طبيعة الاجار',
                        ireq: true,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      DropDownProperty(
                        items: controller.items.cladding,
                        onchanged: (String? val) {
                          controller.updateTybe(val!,controller.claddingselected);
                        },
                        value: controller.claddingselected,
                        nameofitem: 'الفرش',
                        ireq: true,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      DropDownProperty(
                        items: controller.items.direction,
                        onchanged: (String? val) {
                          controller.updateTybe(val!,controller.directionselected);
                        },
                        value: controller.directionselected,
                        nameofitem: 'الاتجاه',
                        ireq: true,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      // DropDownProperty(
                      //   items: controller.items.condition,
                      //   onchanged: (String? val) {
                      //     controller.updateTybe(val!,controller.conditionselected);
                      //   },
                      //   value: controller.conditionselected,
                      //   nameofitem: 'الإكساء',
                      //   ireq: false,
                      // ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      DropDownProperty(
                        items: controller.items.location,
                        onchanged: (String? val) {
                          controller.updateTybe(val!,controller.locationselected!);
                        },
                        value: controller.locationselected,
                        nameofitem: 'الموقع',
                        ireq: true,
                      ),
                      SizedBox(height: 10.sp,),
                      AddPropertyText(
                        dataText: controller.data.location!.street!,

                        isnum: false,
                        nameofitem: 'الشارع ',
                        isreq: true,
                        controller: controller.street,
                        valid: (String? val ) {
                          return validInput(val!, 1, 20, "type");
                        },
                      ),
                      AddPropertyText(
                        dataText: controller.data.location!.region!,

                        isnum: false,
                        nameofitem: 'المنطقة ',
                        isreq: true,
                        controller: controller.regoin,
                        valid: (String? val ) {
                          return validInput(val!, 3, 20, "type");
                        },
                      ),

                      SizedBox(
                        height: 20.sp,
                      ),
                      Container(
                          padding: EdgeInsets.all(5.sp),
                          width: double.infinity,
                          child: Text(
                            "ميزات اضافية",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Tejwal",
                                fontSize: 16.sp),
                            textAlign: TextAlign.end,
                          )),
                      Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CoustomButtomAditional(
                                varname: controller.pool,
                                onTap: () {
                                  controller
                                      .changestateofAdditionalfeatures("pool");
                                }, label: 'مسبح',
                              ),

                              CoustomButtomAditional(
                                varname: controller.solar_panels,
                                onTap: () {
                                  controller
                                      .changestateofAdditionalfeatures("solar_panels");
                                }, label: 'طاقة شمسية',
                              )
                            ],
                          ),
                          SizedBox(height: 10.sp,),
                          CoustomButtomAditional(
                            varname: controller.elevator,
                            onTap: () {
                              controller
                                  .changestateofAdditionalfeatures("elevator");
                            }, label: 'مصعد',
                          )
                        ],
                      ),
                      SizedBox(height: 10.sp,),
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
                              child: const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        validator: (String? val){
                          return validInput(val!, 1, 1000, "type");
                        },
                        controller: controller.description,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:'اترك وصف العقار هنا',
                        ),
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      CoustomButtomBar(
                          onPressednext: () {
                            controller.UpdateData();
                          },
                          onPressedremove: () {
                            controller.onCancle();
                          })
                    ],
                  ),
                ),
              ])),
        ), );
      },
      ),


    );
  }
}
