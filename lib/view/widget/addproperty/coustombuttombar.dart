import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constanat/colors.dart';

class CoustomButtomBar extends StatelessWidget {
  final void Function()? onPressednext;
  final void Function()? onPressedremove;

  const CoustomButtomBar({
    Key? key,
    required this.onPressednext,
    required this.onPressedremove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.greencolor,
      width: double.infinity,
      height: 50.sp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            onPressed: onPressedremove,
            child: Text(
              "إلغاء",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            onPressed: onPressednext,
            child: Text(
              "التالي",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
