import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constanat/colors.dart';
class CoustomCategory extends StatelessWidget {
  final String imageurl;
  final String title;
  const CoustomCategory({super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    return                   Container(
      clipBehavior: Clip.none,
      width: 75.sp,
      height: 75.sp,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              imageurl,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.greencolor,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
              top:40.sp,
              left: 10.sp,
              child: Text(
                title,
                style: TextStyle(color: Colors.white,fontFamily: "TejwalBold",shadows:[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 3,
                    offset: Offset(2,2)
                  )
                ] ),
              )),

        ],
      ),
    )
    ;
  }
}
