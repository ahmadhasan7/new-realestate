import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/stutusconntection.dart';
import '../../core/constanat/dropdownitems.dart';
import '../../core/constanat/routing.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/models/propertymodel.dart';
import '../../data/remote/filtered_search_data.dart';

class FilteredSearchController extends GetxController {
  FilteredSearchData filteredSearchData = FilteredSearchData(Get.find());
  List<PropertyModel> data = [];
  MyServices myServices = Get.find();
   StatusRequest statusRequest=StatusRequest.none;
   String tybeOfPropertyselected = 'شقة';
  String floorselected = '';
  String Rentalperiodselected = 'يومي';
  String stutus = "للبيع";
  String claddingselected = '';
  String locationselected = 'دمشق';
  String conditionselected = "";
  bool changeitems = true;
  bool isSliderEnabled = false;
  RangeValues selectedRange = RangeValues(50, 100);

  DropDownItems items = DropDownItems();

  void changeRange(RangeValues values) {
    selectedRange = values;
    update();
  }

  void toggleSlider(bool isEnabled) {
    isSliderEnabled = isEnabled;
    update();
  }

  void updateTybeOfDropDown(String tybe, String val) {
    switch (tybe) {
      case 'claddingselected':
        claddingselected = val;
        break;

      case 'conditionselected':
        conditionselected = val;
        break;
      case 'locationselected':
        locationselected = val;
        break;
      case 'tybeOfPropertyselected':
        tybeOfPropertyselected = val;
        break;
      case 'floorselected':
        floorselected = val;
        break;
      case 'Rentalperiodselected':
        Rentalperiodselected = val;
        break;
      default:
        print("00000000");
    }
    update();
  }

  void changestutus(String? val) {
    stutus = val!;
    if (val == "للبيع") {
      changeitems = true;
    } else {
      changeitems = false;
    }
    update();
  }

  void uplodeData() async {
    data.clear();
    print("00000000000000000000000000000000000");
    statusRequest = StatusRequest.loading;
    update();
    var response = await filteredSearchData.getPropertyData(
      token: myServices.pref.getString('token')!,
      property_type: tybeOfPropertyselected,
      property_status: stutus,
      covering: conditionselected,
      rent_type: changeitems ? '' : Rentalperiodselected,
      city: locationselected,
      floor_number: floorselected,
      furnishing: claddingselected,
      price_gt: isSliderEnabled?"${selectedRange.end.toInt()}":'',
      price_lt:isSliderEnabled?"${selectedRange.start.toInt()}":'',
    );
    statusRequest = handlingData(response);
    print(myServices.pref.getString('token')!);

    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      data = (response as List)
          .map((item) => PropertyModel.fromJson(item))
          .toList();
      Get.toNamed(AppRoute.filteredpropertysearch,arguments: data);

      update();
    }
  }
}
