import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constanat/image.dart';
import '../../../core/functions/validetor.dart';
import '../auth/customtextformauth.dart';
class CoustomPhoto extends StatelessWidget {
  const CoustomPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: Image.asset(
            "Assets/images/123.jpg",
            height: 150.sp,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Positioned(
            top: 50.sp,
            left: 15.sp,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: CustomTextFormAuth(
                hinttext: 'ابحث عن عقارك',
                mycontroller: null,
                valid: (value) {
                  Validetor("email", 10, 10, value!);
                },
                isNumber: false,
                icons: Icon(Icons.search),
              ),
            ))
      ],
    );
  }
}
