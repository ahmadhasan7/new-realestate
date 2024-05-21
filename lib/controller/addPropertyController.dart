import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:realestate/core/constanat/routing.dart';
import 'package:realestate/data/models/dropdownmodel.dart';

class AddPropertyController extends GetxController {
  List<File> selectedImages = [];
  String tybeOfPropertyselected = 'شقة';
  String floorselected = 'قبو2';
  String prpertyFounderselected = 'طابو أخضر';
  String Ownertypeselected = 'مالك';
  String claddingselected = 'نص مفروش';
  String directionselected = 'الجنوب';
  String conditionselected = 'سوبر ديلوكس';
  String locationselected = 'دمشق';
  String Rentalperiodselected = 'يومي';
  String stutus = "بيع";
  bool changeitems = true;
  late TextEditingController price;
  late TextEditingController size;
  late TextEditingController numOfRoom;
  late TextEditingController description;

  late TextEditingController userPhone;
  late TextEditingController Dateuser;

  /////List Of Dropdown Items
  List<DropDownModel> tybeOfProperty = [
    DropDownModel(text: "شقة", value: "شقة"),
    DropDownModel(text: "فيلا", value: "فيلا"),
    DropDownModel(text: "مكتب", value: "مكتب"),
    DropDownModel(text: "مزرعة", value: "مزرعة"),
    DropDownModel(text: "محل تجاري", value: "محل تجاري"),
    DropDownModel(text: "بناء", value: "بناء"),
    DropDownModel(text: "شاليه", value: "شاليه"),
  ];
  List<DropDownModel> floor = [
    DropDownModel(text: "قبو2", value: "قبو2"),
    DropDownModel(text: "قبو1", value: "قبو1"),
    DropDownModel(text: "الطابق الأرضي", value: "الطابق الأرضي"),
    DropDownModel(text: "الطابق1", value: "الطابق1"),
    DropDownModel(text: "الطابق2", value: "الطابق2"),
    DropDownModel(text: "الطابق3", value: "الطابق3"),
    DropDownModel(text: "الطابق4", value: "الطابق4"),
    DropDownModel(text: "الطابق5", value: "الطابق5"),
    DropDownModel(text: "الطابق6", value: "الطابق6"),
    DropDownModel(text: "الطابق7", value: "الطابق7"),
    DropDownModel(text: "الطابق8", value: "الطابق8"),
    DropDownModel(text: "الطابق9", value: "الطابق9"),
    DropDownModel(text: "الطابق10", value: "الطابق10"),
    DropDownModel(text: "الطابق11", value: "الطابق11"),
    DropDownModel(text: "الطابق12", value: "الطابق12"),
  ];
  List<DropDownModel> prpertyFounder = [
    DropDownModel(text: "طابو أخضر", value: "طابو أخضر"),
    DropDownModel(text: "عقد بيع قطعي", value: "عقد بيع قطعي"),
    DropDownModel(text: "حكم محكمة", value: "حكم محكمة"),
    DropDownModel(text: "وكالة كاتب بالعدل", value: "وكالة كاتب بالعدل"),
    DropDownModel(text: "طابو أسهم", value: "طابو أسهم"),
    DropDownModel(text: "طابو زراعي", value: "طابو زراعي"),
    DropDownModel(text: "طابو إسكان", value: "طابو إسكان"),
    DropDownModel(text: "فروغ", value: "فروغ"),
  ];
  List<DropDownModel> Ownertype = [
    DropDownModel(text: "مالك", value: "مالك"),
    DropDownModel(text: "تاجر", value: "تاجر"),
  ];
  List<DropDownModel> cladding = [
    DropDownModel(text: "غير مفروش", value: "غير مفروش"),
    DropDownModel(text: "نص مفروش", value: "نص مفروش"),
    DropDownModel(text: " مفروش", value: "مفروش"),
  ];
  List<DropDownModel> direction = [
    DropDownModel(text: "الغرب", value: "الغرب"),
    DropDownModel(text: "الشرق", value: "الشرق"),
    DropDownModel(text: " الشمال", value: "الشمال"),
    DropDownModel(text: " الجنوب", value: "الجنوب"),
    DropDownModel(text: " الشمال الشرقي", value: "الشمال الشرقي"),
    DropDownModel(text: " الشمال الغربي", value: "الشمال الغربي"),
    DropDownModel(text: " الشمال الجنوبي", value: "الشمال الجنوبي"),
    DropDownModel(text: " الجنوب الشرقي", value: "الجنوب الشرقي"),
    DropDownModel(text: " الجنوب الغربي", value: "الجنوب الغربي"),
    DropDownModel(text: " الغرب الشرقي", value: "الغرب الشرقي")
  ];
  List<DropDownModel> condition = [
    DropDownModel(text: "سوبر ديلوكس", value: "سوبر ديلوكس"),
    DropDownModel(text: "كسوة جيدة", value: "كسوة جيدة"),
    DropDownModel(text: " حالة جيدة", value: "حالة جيدة"),
    DropDownModel(text: "اكساء قديم", value: "اكساء قديم"),
    DropDownModel(text: "على العظم", value: "على العظم"),
  ];
  List<DropDownModel> location = [
    DropDownModel(text: "دمشق", value: "دمشق"),
    DropDownModel(text: "ريف مشق", value: "ريف دمشق"),
    DropDownModel(text: " اللاذقية", value: "اللاذقية"),
    DropDownModel(text: " ريف اللاذقية", value: "ريف اللاذقية"),
    DropDownModel(text: " حلب", value: "حلب"),
    DropDownModel(text: "ريف حلب", value: "ريف حلب"),
    DropDownModel(text: "حمص", value: "حمص"),
    DropDownModel(text: " ريف حمص", value: "ريف حمص"),
    DropDownModel(text: " حماة", value: "حماة"),
    DropDownModel(text: " ريف حماة", value: "ريف حماة"),
    DropDownModel(text: "طرطوس", value: "طرطوس"),
    DropDownModel(text: "ريف طرطوس", value: "ريف طرطوس"),
    DropDownModel(text: " السويداء", value: "السويداء"),
    DropDownModel(text: " ريف السويداء", value: "ريف السويداء"),
    DropDownModel(text: " دير الزور", value: "دير الزور"),
    DropDownModel(text: "ريف دير الزور", value: "ريف دير الزور"),
    DropDownModel(text: "درعا", value: "درعا"),
    DropDownModel(text: " ريف درعا", value: "ريف درعا"),
    DropDownModel(text: " الحسكة", value: "الحسكة"),
    DropDownModel(text: " ريف الحسكة", value: "ريف الحسكة"),
    DropDownModel(text: " القنيطرة", value: "القنيطرة"),
    DropDownModel(text: " ريف القنيطرة", value: "ريف القنيطرة"),
  ];
  List<DropDownModel> Rentalperiod = [
    DropDownModel(text: "يومي", value: "يومي"),
    DropDownModel(text: "شهري", value: "شهري"),
    DropDownModel(text: " السنوي", value: "سنوي"),
  ];

/////update value od dropdoun
  void tybeOfPropertyupdate(String? val) {
    tybeOfPropertyselected = val!;
    update();
  }

  void floorupdate(String? val) {
    floorselected = val!;
    update();
  }

  void prpertyFounderupdate(String? val) {
    prpertyFounderselected = val!;
    update();
  }

  void Ownertypeupdate(String? val) {
    Ownertypeselected = val!;
    update();
  }

  void claddingupdate(String? val) {
    claddingselected = val!;
    update();
  }

  void directionupdate(String? val) {
    directionselected = val!;
    update();
  }

  void conditionupdate(String? val) {
    conditionselected = val!;
    update();
  }

  void Rentalperiodupdate(String? val) {
    Rentalperiodselected = val!;
    update();
  }

  void locationupdate(String? val) {
    tybeOfPropertyselected = val!;
    update();
  }

  void changestutus(String? val) {
    stutus = val!;
    if (val == "بيع") {
      changeitems = true;
    } else {
      changeitems = false;
    }
    update();
  }

  Future<void> pickImages() async {
    List<XFile>? pickedImages =
        await ImagePicker().pickMultiImage(imageQuality: 50);

    if (pickedImages != null) {
      selectedImages = pickedImages.map((file) => File(file.path)).toList();
      update();
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
      Get.offNamed(AppRoute.AddPropertyDetails);
    }
  }

  removepage() {
    Get.offNamed(AppRoute.homepage);
  }
  gotonextscreen(){
    Get.toNamed(AppRoute.AddCoustomerData);
  }
  @override
  void onInit() {
    userPhone=TextEditingController();
    Dateuser=TextEditingController();
    price = TextEditingController();
    numOfRoom = TextEditingController();
    size = TextEditingController();
    description=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userPhone.dispose();
    Dateuser.dispose();
    price.dispose();
    description.dispose();
    numOfRoom.dispose();
    size.dispose();
    super.dispose();
  }
}
