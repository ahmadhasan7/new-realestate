import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'coustomdatadetails.dart';
import 'coustomlabel.dart';
class CoustomhandlingDataPropertyDetails extends StatelessWidget {
  const CoustomhandlingDataPropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CoustomLabel(label: ""),
                const SizedBox(
                  height: 15,
                ),
                const CoustomLabel(label: "وصف العقار"),
                Text("",
                  style: const TextStyle(fontFamily: "Tejwal"),
                  textAlign: TextAlign.end,
                ),
                SizedBox(
                  height: 10.sp,
                ),
                const  CoustomLabel(label: "خصائص العقار"),
                const Divider(
                  color: Colors.grey,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustomDataDetails(
                        imageurl: "Assets/images/88.png",
                        title: "المساحة",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8.png",
                        title: "رقم الطابق",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "نوع الملكية",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/125126-200.png",
                        title: "عدد الغرف ",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/125126-200.png",
                        title: "عدد المطابخ",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/125126-200.png",
                        title: "عدد غرف المعيشة",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/125126-200.png",
                        title: "عدد غرف النوم",
                        ammount: ""),

                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/888.png",
                        title: "نوع البائع",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8888.png",
                        title: "الفرش",
                        ammount: ""),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    const CoustomDataDetails(
                        imageurl: "Assets/images/88888.png",
                        title: "الاتجاه",
                        ammount: "قبلة"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    const CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "الحالة",
                        ammount: "جيدة جدا"),

                    Divider(
                      color: Colors.grey.shade100,
                    ),
                  ],
                ),
                const  CoustomLabel(label: "الموقع"),
                CoustomDataDetails(
                    imageurl: "Assets/images/8888888.png",
                    title: "المدينة",
                    ammount: ""),
                Divider(
                  color: Colors.grey.shade100,
                ),

                CoustomDataDetails(
                    imageurl: "Assets/images/8888888.png",
                    title: "المنطقة",
                    ammount: ""),
                Divider(
                  color: Colors.grey.shade100,
                ),

                CoustomDataDetails(
                    imageurl: "Assets/images/8888888.png",
                    title: "الشارع",
                    ammount: ""),

                Divider(
                  color: Colors.grey.shade100,
                ),
                CoustomLabel(label: "ميزات إضافية"),
                SizedBox(height: 10.sp,),
                CoustomDataDetails(
                    imageurl: "Assets/images/8888888.png",
                    title: "مصعد",
                    ammount: "1"),

                const CoustomDataDetails(
                    imageurl: "Assets/images/8888888.png",
                    title: "مسبح",
                    ammount: "1"),
                SizedBox(height: 10.sp,),
                const   CoustomLabel(label: "تفاصيل الإعلان"),
                SizedBox(height: 10.sp,),
                CoustomDataDetails(
                    imageurl: "Assets/images/8888888.png",
                    title: "تاريخ النشر",
                    ammount:""
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
