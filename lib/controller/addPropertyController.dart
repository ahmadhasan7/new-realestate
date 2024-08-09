import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/core/constanat/dropdownitems.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/data/remote/prpertydetailsdata.dart';
import '../core/class/stutusconntection.dart';
import '../core/functions/handingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/remote/propertyimage.dart';

class AddPropertyController extends GetxController {
  List<File> selectedImages = [];
  File? imgFile;
  String tybeOfPropertyselected = 'شقة';
  String floorselected = '2';
  String prpertyFounderselected = 'طابو أخضر';
  String Ownertypeselected = 'مالك';
  String claddingselected = 'نص مفروش';
  String directionselected = 'جنوب';
  String conditionselected = 'ممتاز';
  String locationselected = 'دمشق';
  String Rentalperiodselected = 'يومي';
  String stutus = "للبيع";
  bool pool = false;
  bool solar_panels = false;
  bool elevator = false;
  String? propertyid;
  final GlobalKey<FormState> propertydetailsKey = GlobalKey<FormState>();
  final GlobalKey<FormState> coustomerDetailsKey = GlobalKey<FormState>();
  void changestateofAdditionalfeatures(String featureName) {
    if (featureName == "pool") {
      pool = !pool;
    } else if (featureName == "solar_panels") {
      solar_panels = !solar_panels;
    } else if (featureName == "elevator") {
      elevator = !elevator;
    }
    update();
  }

  PropertyDetailsData propertyData = PropertyDetailsData(Get.find());
  PropertyImages propertyImages = PropertyImages(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest=StatusRequest.none;
  bool changeitems = true;
  late TextEditingController price;
  late TextEditingController size;
  late TextEditingController numOfRoom;
  late TextEditingController description;
  late TextEditingController userPhone;
  late TextEditingController Dateuser;
  late TextEditingController title;
  late TextEditingController regoin;
  late TextEditingController street;
  late TextEditingController bedroom;
  late TextEditingController bathroom;
  late TextEditingController kitchin;
  late TextEditingController livingroom;
  late TextEditingController numofproperty;
  DropDownItems items = DropDownItems();

  void updateTybeOfDropDown(String tybe,String val ) {
      switch (tybe) {
        case 'tybeOfPropertyselected':
          tybeOfPropertyselected = val;
          break;
        case 'floorselected':
          floorselected = val;
          break;
        case 'prpertyFounderselected':
          prpertyFounderselected = val;
          break;
        case 'Ownertypeselected':
          Ownertypeselected = val;
          break;
        case 'claddingselected':
          claddingselected = val;
          break;
        case 'directionselected':
          directionselected = val;
          break;
        case 'conditionselected':
          conditionselected = val;
          break;
        case 'locationselected':
          locationselected = val;
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

  Future<void> pickImages(bool multiImage) async {
    if (multiImage) {
      List<XFile>? pickedImages =
          await ImagePicker().pickMultiImage(imageQuality: 50);
      if (pickedImages != null) {
        selectedImages = pickedImages.map((file) => File(file.path)).toList();
        print(selectedImages);
        update();
      }
    } else {
      final selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        imgFile = File(selectedImage.path);
        print(imgFile);
        update();
      }
    }
  }

  removephoto(int index) {
    selectedImages.removeAt(index);
    update();
  }

  nextpage() {
    if (selectedImages.length < 3 || selectedImages.length > 13) {
      Get.snackbar(
          "خطأ", "الرجاء تحديد على الأقل ثلاث صور وعلى الأكثر 12 صورة");
    } else {
      Get.toNamed(AppRoute.AddPropertyDetails);
    }
  }

  void goToCoustomerPage(GlobalKey<FormState> propertydetailsKey) {
    if (propertydetailsKey.currentState!.validate()) {
      imgFile!=null?Get.toNamed(AppRoute.AddCoustomerData):Get.snackbar(
        "تحذير",
        "لا يمكن اتمام العملة قبل وضع صورة",
        colorText: Colors.white,
        backgroundColor:AppColors.greencolor ,
        icon: const Icon(Icons.add_alert),
      );

    }
    else{
      print("object");
    }

  }

  removepage() {
    Get.offNamed(AppRoute.homepage);
  }

  gotonextscreen() {
      Get.toNamed(AppRoute.AddCoustomerData);
  }

  uplodeAllDetails() {
    Get.defaultDialog(
        title: "هل تريد بالتأكيد أضافة عقارك؟",
        middleText: "بحال التأكيد سيتم وضع عقارك ضمن التطبيق",
        textCancel: "لا",
        textConfirm: "تأكيد الطلب",
        onCancel: () {
          Get.back();
        },
        onConfirm: () {
          Get.back();
          uplodeDetails();
        });
  }

  uplodePhotos(String id) async {
    print(statusRequest);
    var response = await propertyImages.AddPropertyImages(
        myServices.pref!.getString('token')!, selectedImages, id);
    statusRequest = handlingData(response);
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      Get.snackbar(
        "العملية نجحت",
        "تمت اضافة عقارك بنجاح",
        colorText: Colors.white,
        backgroundColor:AppColors.greencolor ,
        icon: const Icon(Icons.add_alert),
      );
      Get.offAllNamed(AppRoute.homepage);
    }
  }

  uplodeDetails() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await propertyData.AddPropertyDetialsData(
        tybeOfPropertyselected.toString(),
        imgFile!,
        userPhone.text,
        title.text,
        description.text,
        locationselected.toString(),
        regoin.text,
        street.text,
        numofproperty.text,
        price.text,
        "".toString(),
        "".toString(),
        floorselected.toString(),
        bedroom.text,
        bathroom.text,
        kitchin.text,
        livingroom.text,
        stutus,
        elevator,
        pool,
        solar_panels,
        claddingselected.toString(),
        directionselected,
        numOfRoom.text,
        Ownertypeselected.toString(),
        conditionselected,
        myServices.pref!.getString('token')!);
    statusRequest = handlingData(response);
    update();
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      propertyid = response['id'];
      uplodePhotos(propertyid!);
    }

  }

  @override
  void onInit() {
    userPhone = TextEditingController();
    Dateuser = TextEditingController();
    price = TextEditingController();
    numOfRoom = TextEditingController();
    size = TextEditingController();
    description = TextEditingController();
    street = TextEditingController();
    title = TextEditingController();
    regoin = TextEditingController();
    bathroom = TextEditingController();
    bedroom = TextEditingController();
    kitchin = TextEditingController();
    livingroom = TextEditingController();
    numofproperty = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    numofproperty.dispose();
    bedroom.dispose();
    bathroom.dispose();
    kitchin.dispose();
    livingroom.dispose();
    userPhone.dispose();
    Dateuser.dispose();
    price.dispose();
    description.dispose();
    numOfRoom.dispose();
    size.dispose();
    title.dispose();
    super.dispose();
  }
}
