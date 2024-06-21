import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constanat/colors.dart';
import '../../../data/models/dropdownmodel.dart';
class DropDownProperty extends StatelessWidget {
  final List<DropDownModel> items;
  final void Function(String? val) onchanged;
  final String value;
  final String nameofitem;
  final bool ireq;
  const DropDownProperty({super.key, required this.items, required this.onchanged, required this.value, required this.nameofitem, required this.ireq});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: AppColors.greencolor,
              borderRadius: BorderRadius.circular(15.sp)),
          width: 125.sp,
          child: DropdownButton(
            items: items.map((e) {
              return DropdownMenuItem(
                child: Text(e.text,textAlign: TextAlign.center,),
                value: e.value,
              );
            }).toList(),
            onChanged: onchanged,
            focusColor: Colors.black,
            iconEnabledColor: Colors.white,
            value: value,
            style:
            TextStyle(color: Colors.white, fontFamily: "Tejwal"),
            isExpanded: true,
            dropdownColor: Color(0xff008f7b),
          ),
        ),
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
        ireq
            ? Container(width: 5.sp,
          child: Icon(Icons.star, color: Colors.yellow,size: 15,),)
            : Container(width: 5.sp,),
      ],
    );
  }
}
