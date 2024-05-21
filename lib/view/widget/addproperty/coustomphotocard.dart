import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CoustomPhotoCard extends StatelessWidget {
  const CoustomPhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      width: 30.sp,
      height: 30.sp,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child:Image.asset("Assets/images/addimage.png",color: Colors.grey.shade700,) ,
    );
  }
}
