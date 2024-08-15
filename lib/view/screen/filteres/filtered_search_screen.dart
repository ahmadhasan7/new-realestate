import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/filters/filtered_search_controller.dart';
import 'package:realestate/core/class/stutusconntection.dart';
import 'package:realestate/core/constanat/colors.dart';

import '../../widget/Coustom_text.dart';
import '../../widget/addproperty/coustomradiobuttom.dart';
import '../../widget/addproperty/dropdownproperty.dart';
import '../../widget/filteredsearch/CoustomRangeSlider.dart';

class FilteredSearch extends StatelessWidget {
  const FilteredSearch({super.key});

  @override
  Widget build(BuildContext context) {
    FilteredSearchController controller = Get.put(FilteredSearchController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greencolor,
        title: const Text("بحث مفلتر",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: GetBuilder<FilteredSearchController>(
        builder: (controller) {
          return Container(
            // decoration: const BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("Assets/images/12.jpg"),
            //     fit: BoxFit.fitHeight,
            //   ),
            // ),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoustomRedioButton(
                      val: "للأجار",
                      groupval: controller.stutus,
                      onchanged: (val) {
                        controller.changestutus(val!);
                      },
                      title: 'اجار',
                    ),
                    CoustomRedioButton(
                      val: "للبيع",
                      groupval: controller.stutus,
                      onchanged: (val) {
                        controller.changestutus(val!);
                      },
                      title: 'بيع',
                    ),
                  ],
                ),
                DropDownProperty(
                  items: controller.items.tybeOfProperty,
                  onchanged: (String? val) {
                    controller.updateTybeOfDropDown(
                        'tybeOfPropertyselected', val!);
                  },
                  value: controller.tybeOfPropertyselected,
                  nameofitem: 'نوع العقار',
                  ireq: true,
                ),
                SizedBox(
                  height: 14.sp,
                ),
                DropDownProperty(
                  items: controller.items.floor,
                  onchanged: (String? val) {
                    controller.updateTybeOfDropDown('floorselected', val!);
                  },
                  value: controller.floorselected,
                  nameofitem: 'رقم الطابق',
                  ireq: true,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                DropDownProperty(
                  items: controller.items.cladding,
                  onchanged: (String? val) {
                    controller.updateTybeOfDropDown('claddingselected', val!);
                  },
                  value: controller.claddingselected,
                  nameofitem: 'الفرش',
                  ireq: true,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                DropDownProperty(
                  items: controller.items.condition,
                  onchanged: (String? val) {
                    controller.updateTybeOfDropDown('conditionselected', val!);
                  },
                  value: controller.conditionselected,
                  nameofitem: 'الإكساء',
                  ireq: false,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                controller.changeitems
                    ? Container()
                    : DropDownProperty(
                        items: controller.items.Rentalperiod,
                        onchanged: (String? val) {
                          controller.updateTybeOfDropDown(
                              'Rentalperiodselected', val!);
                        },
                        value: controller.Rentalperiodselected,
                        nameofitem: 'نوع الاجار',
                        ireq: false,
                      ),
                SizedBox(
                  height: 10.sp,
                ),
                DropDownProperty(
                  items: controller.items.location,
                  onchanged: (String? val) {
                    controller.updateTybeOfDropDown('locationselected', val!);
                  },
                  value: controller.locationselected,
                  nameofitem: 'الموقع',
                  ireq: true,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: controller.isSliderEnabled,
                      onChanged: (bool? value) {
                        controller.toggleSlider(value!);
                      },
                    ),
                    Text(
                      "تفعيل البحث عن طريق السعر",
                      style: TextStyle(
                        fontFamily: "Tejwal",
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                controller.changeitems
                    ? Text(
                        "المجال المحتمل للسعر",
                        style: TextStyle(
                            color: AppColors.greencolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Tejwal",
                            fontSize: 15.sp),
                      )
                    : Text(
                        "المجال المحتمل للاجار",
                        style: TextStyle(
                            color: AppColors.greencolor,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Tejwal",
                            fontSize: 15.sp),
                      ),
                controller.changeitems
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CoustomText(
                              data:
                                  " مليون${controller.selectedRange.start.toInt()}",
                              fontsize: 15,
                            ),
                            CoustomText(
                                data:
                                    " مليون${controller.selectedRange.end.toInt()}",
                                fontsize: 15)
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CoustomText(
                              data:
                                  " ليرة${controller.selectedRange.start.toInt()}",
                              fontsize: 15,
                            ),
                            CoustomText(
                                data:
                                    " ليرة${controller.selectedRange.end.toInt()}",
                                fontsize: 15)
                          ],
                        ),
                      ),
                CoustomRangeSlider(
                  selectedRange: controller.selectedRange,
                  onChanged: (RangeValues newValues) {
                    controller.changeRange(newValues);
                  },
                  isEnabled: controller.isSliderEnabled, // Pass the enabled state
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.uplodeData();
                    },
                     child: controller.statusRequest == StatusRequest.loading
                        ?  CircularProgressIndicator(
                            color: Colors.white,
                          )
                        :   Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "بحث",
                                style: TextStyle(color: Colors.white),
                              ),
                               Icon(
                                Icons.search,
                                color: Colors.white,
                              )
                            ],
                          ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            controller.statusRequest == StatusRequest.loading
                                ? Colors.grey
                                : AppColors.greencolor),
                  ),
                )
              ],
            )),
          );
        },
      ),
    );
  }
}
