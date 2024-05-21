import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/view/widget/propertydetails/coustomdatadetails.dart';
import 'package:realestate/view/widget/propertydetails/coustomlabel.dart';
import 'package:realestate/view/widget/propertydetails/imageviewer.dart';
import '../../controller/propertydetailscontroller.dart';
class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PropertyDetailsController controller=Get.put(PropertyDetailsController());
    return Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 45.sp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone,
                color: AppColors.greencolor,
              ),
              SizedBox(
                width: 10.sp,
              ),
              Text("التواصل مع المالك")
            ],
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text(
            "تفاصيل العقار",
            style: TextStyle(
                fontFamily: "TejwalBold", fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ImageViewer(
                  imageUrls: [],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new,
                              size: 10,
                            ),
                            Text("قارن"),
                          ],
                        )),
                    Container(
                      color: AppColors.greencolor,
                      width: 50.sp,
                      height: 20.sp,
                      child: Text(
                        "مباع",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CoustomLabel(label: "450.000.000"),
                    SizedBox(
                      height: 15,
                    ),
                    CoustomLabel(label: "وصف العقار"),
                    Text(
                      "أخر المليحة أول زيدين تبعد عن جامع عثمان 10كيلو متر على خط السرفيس ضمن مجمع مزارع . غرفتين وصالون لكل غرفة فيها تختين وفيها 4 فرشات اضافة بالاضافة لصالون كبير فيه طقم كنبايات ويوجد عدة مطابخ فيها وكاسات وصحون ووو.....",
                      style: TextStyle(fontFamily: "Tejwal"),
                      textAlign: TextAlign.end,
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    CoustomLabel(label: "خصائص العقار"),
                    Divider(
                      color: Colors.grey,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/88.png",
                        title: "المساحة",
                        ammount: "10"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8.png",
                        title: "رقم الطابق",
                        ammount: "10"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "نوع الملكية",
                        ammount: "كاتب بالعدل"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/125126-200.png",
                        title: "عدد الغرف",
                        ammount: "155"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/888.png",
                        title: "نوع البائع",
                        ammount: "تاجر"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8888.png",
                        title: "الفرش",
                        ammount: "مفروش"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/88888.png",
                        title: "الاتجاه",
                        ammount: "قبلة"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "الحالة",
                        ammount: "جيدة جدا"),
                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomLabel(label: "ميزات إضافية"),
                    SizedBox(height: 10.sp,),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "مسبح",
                        ammount: "1"),
                    SizedBox(height: 10.sp,),
                    CoustomLabel(label: "تفاصيل الإعلان"),
                    SizedBox(height: 10.sp,),
                    CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "تاريخ النشر",
                        ammount: "13/1/2024"),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
