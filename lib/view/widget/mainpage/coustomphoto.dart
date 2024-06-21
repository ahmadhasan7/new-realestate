import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../auth/customtextformauth.dart';
class Coustomphoto extends StatelessWidget {
  const Coustomphoto({super.key});

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
                mycontroller: TextEditingController(),
                valid: (value) {

                },
                isNumber: false,
                icons: Icon(Icons.search),
              ),
            ))
      ],
    );
  }
}
