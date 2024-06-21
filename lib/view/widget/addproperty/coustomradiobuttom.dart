import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/core/constanat/colors.dart';

class CoustomRedioButton extends StatelessWidget {
  final String val;
  final String title;
  final String groupval;
  final void Function(String?) onchanged;

  const CoustomRedioButton(
      {super.key,
      required this.val,
      required this.groupval,
      required this.onchanged, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: val,
          groupValue: groupval,
          onChanged: onchanged,
          activeColor: AppColors.greencolor,
        ),
        Text(title,style: TextStyle(fontFamily: "Tejwal",fontSize: 20.sp),)
      ],
    );
  }}
