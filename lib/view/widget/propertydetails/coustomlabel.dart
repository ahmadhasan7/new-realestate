import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CoustomLabel extends StatelessWidget {
  final String label;
  const CoustomLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return  Text(
      label,
      style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontFamily: "TejwalBold",
          fontSize: 25.sp),
    );
  }
}
