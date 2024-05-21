import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constanat/colors.dart';
import '../../../data/models/dropdownmodel.dart';
import '../../widget/auth/customtextformauth.dart';
import 'coustomtextfeild.dart';

class AddPropertyText extends StatelessWidget {
  final String nameofitem;
  final bool isreq;
  final TextEditingController controller;
  const AddPropertyText(
      {super.key, required this.nameofitem, required this.isreq, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        CoustomTextFieldProperty(
          hinttext: '',
          mycontroller: controller,
          valid: (String? val) {},
          isNumber: true, width: 120.sp,),
        Container(
          width: 125.sp,
          child: Text(
            nameofitem,
            style: TextStyle(
                fontFamily: "Tejwal",
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.sp),
            textAlign: TextAlign.end,
          ),
        ),
        isreq
            ? Container(width: 5.sp,
          child: Icon(Icons.star, color: Colors.yellow,size: 15,),)
            : Container(width: 5.sp,),
      ],
    );
  }
}
