import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constanat/colors.dart';
class CoustomBottom extends StatelessWidget {
  final void Function() onpress;
  final String title;
  const CoustomBottom({super.key, required this.onpress, required this.title});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onpress ,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          decoration: BoxDecoration(
              color: AppColors.greencolor,
              borderRadius: BorderRadius.circular(15.sp)
          ),
          child: Text(title,style: TextStyle(color: Colors.white),),
        )
    );
  }
}
