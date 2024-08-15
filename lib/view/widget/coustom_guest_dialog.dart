import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/core/constanat/routing.dart';

showCoustomDialog() {
  return Get.defaultDialog(
      title: "تنبيه",
      content: const Text("لا يمكنك المتابعة قبل تسجيل الدخول"),
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        Get.offAllNamed(AppRoute.signin);
      },
      cancel: Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Text("إلغاء"),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(5)),
      ),
      confirm: Container(
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
        child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white),),
        decoration: BoxDecoration(
            color: AppColors.greencolor,
            borderRadius: BorderRadius.circular(5)),
      ),);
}
