import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CoustomPanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(vertical: 10.sp,horizontal: 10.sp),
              margin: EdgeInsets.symmetric(vertical: 10.sp),
              width:double.infinity,
              height: 40.sp,
              decoration: BoxDecoration( color: Color(0xff00d4b6)),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Row(children: [
                  Text(" حقول إجبارية"),
                  Icon(Icons.star , color: Colors.yellow,)
                ],),
                Text("تفاصيل العقار",style: TextStyle(color: Colors.white,fontFamily: "TejwalBold",
                fontWeight: FontWeight.bold,fontSize: 20.sp),),
                
                
              ],),
            )
            ;
  }
}