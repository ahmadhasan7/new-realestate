import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/core/functions/validinput.dart';
import 'package:realestate/view/widget/addproperty/coustombuttombar.dart';
import 'package:realestate/view/widget/addproperty/coustompanner.dart';
import 'package:realestate/view/widget/addproperty/coustomphotocard.dart';
import 'package:realestate/view/widget/addproperty/coustomradiobuttom.dart';
import '../../../controller/addPropertyController.dart';
import '../../../core/constanat/colors.dart';
import '../../widget/addproperty/addpropertytext.dart';
import '../../widget/addproperty/coustombuttomaditionalfuture.dart';
import '../../widget/addproperty/dropdownproperty.dart';

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
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("Assets/images/12.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: controller.propertydetailsKey,
            child: SingleChildScrollView(
                child: Column(children: [
              CoustomPanner(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CoustomRedioButton(
                    val: "للأجار",
                    groupval: controller.stutus,
                    onchanged: (val) {
                      controller.changestutus(val!);
                    }, title: 'اجار',
                  ),
                  CoustomRedioButton(
                    val: "للبيع",
                    groupval: controller.stutus,
                    onchanged: (val) {
                      controller.changestutus(val!);
                    }, title: 'بيع',
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
                            controller.pickImages(false);
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
                                  child: CoustomPhotoCard(),
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
                        controller.updateTybeOfDropDown('tybeOfPropertyselected',val!);
                      },
                      value: controller.tybeOfPropertyselected,
                      nameofitem: 'نوع العقار',
                      ireq: true,
                    ),
                    SizedBox(height: 14.sp,),

                    AddPropertyText(
                      dataText: null,
                      nameofitem: 'اسم العقار',
                      isreq: true,
                      controller: controller.title,
                      isnum: false, valid: (String? val ) {
                        return validInput(val!, 3, 50, "type");
                    },
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    controller.changeitems
                        ? AddPropertyText(
                      dataText: null,
                            nameofitem: 'السعر',
                            isreq: true,
                            controller: controller.price,
                            isnum: true,
                      valid: (String? val ) {
                        return validInput(val!, 3, 15, "type");
                      },
                          )
                        : AddPropertyText(
                      dataText: null,
                            isnum: true,
                            nameofitem: 'الاجار',
                            isreq: true,
                            controller: controller.price,
                      valid: (String? val ) {
                        return validInput(val!, 3, 15, "type");
                      },
                          ),
                    AddPropertyText(
                      dataText: null,
                      isnum: true,
                      nameofitem: 'المساحة',
                      isreq: true,
                      controller: controller.size,
                      valid: (String? val ) {
                        return validInput(val!, 2, 9,"type");
                      },
                    ),
                    DropDownProperty(
                      items: controller.items.floor,
                      onchanged: (String? val) {
                        controller.updateTybeOfDropDown('floorselected',val!);
                      },
                      value: controller.floorselected,
                      nameofitem: 'رقم الطابق',
                      ireq: true,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    DropDownProperty(
                      items: controller.items.prpertyFounder,
                      onchanged: (String? val) {
                        controller.updateTybeOfDropDown('prpertyFounderselected',val!);
                      },
                      value: controller.prpertyFounderselected,
                      nameofitem: 'نوع الملكية',
                      ireq: true,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    AddPropertyText(
                      dataText: null,
                      isnum: true,
                      nameofitem: 'عدد الغرف',
                      isreq: true,
                      controller: controller.numOfRoom,
                      valid: (String? val ) {
                        return validInput(val!, 1, 2, "type");
                      },
                    ),
                    AddPropertyText(
                      dataText: null,
                      isnum: true,
                      nameofitem: 'عدد غرف النوم',
                      isreq: true,
                      controller: controller.bedroom,
                      valid: (String? val ) {
                        return validInput(val!, 1, 2, "type");
                      },
                    ),
                    AddPropertyText(
                      dataText: null,
                      isnum: true,
                      nameofitem: 'عدد غرف السكن',
                      isreq: true,
                      controller: controller.livingroom,
                      valid: (String? val ) {
                        return validInput(val!, 1, 2, "type");
                      },
                    ),
                    AddPropertyText(
                      dataText: null,
                      isnum: true,
                      nameofitem: 'عدد المطابخ',
                      isreq: true,
                      controller: controller.kitchin,
                      valid: (String? val ) {
                        return validInput(val!, 1, 2, "type");
                      },
                    ),
                    AddPropertyText(
                      dataText: null,
                      isnum: true,
                      nameofitem: 'عدد الحمامات',
                      isreq: true,
                      controller: controller.bathroom,
                      valid: (String? val ) {
                        return validInput(val!, 1, 2, "type");
                      },
                    ),
                    AddPropertyText(
                      dataText: null,
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
                              controller.updateTybeOfDropDown('Ownertypeselected',val!);
                            },
                            value: controller.Ownertypeselected,
                            nameofitem: 'نوع البائع',
                            ireq: true,
                          )
                        : DropDownProperty(
                            items: controller.items.Rentalperiod,
                            onchanged: (String? val) {
                              controller.updateTybeOfDropDown('Rentalperiodselected',val!);
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
                        controller.updateTybeOfDropDown('claddingselected',val!);
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
                        controller.updateTybeOfDropDown('directionselected',val!);
                      },
                      value: controller.directionselected,
                      nameofitem: 'الاتجاه',
                      ireq: true,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    DropDownProperty(
                      items: controller.items.condition,
                      onchanged: (String? val) {
                        controller.updateTybeOfDropDown('conditionselected',val!);
                      },
                      value: controller.conditionselected,
                      nameofitem: 'الإكساء',
                      ireq: false,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    DropDownProperty(
                      items: controller.items.location,
                      onchanged: (String? val) {
                        controller.updateTybeOfDropDown('locationselected',val!);
                      },
                      value: controller.locationselected,
                      nameofitem: 'الموقع',
                      ireq: true,
                    ),
                    SizedBox(height: 10.sp,),
                    AddPropertyText(
                      dataText: null,
                      isnum: false,
                      nameofitem: 'الشارع ',
                      isreq: true,
                      controller: controller.street,
                      valid: (String? val ) {
                        return validInput(val!, 1, 20, "type");
                      },
                    ),
                    AddPropertyText(
                      dataText: null,
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
                        hintText: 'اترك وصف عقارك هنا',
                      ),
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CoustomButtomBar(
                        onPressednext: () {
                          controller.goToCoustomerPage(controller.propertydetailsKey);
                        },
                        onPressedremove: () {Get.back();})
                  ],
                ),
              ),
            ])),
          ),
        );
      }),
    );
  }
}
