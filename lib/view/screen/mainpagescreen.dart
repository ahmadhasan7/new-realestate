import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/core/constanat/image.dart';
import 'package:realestate/core/functions/validetor.dart';
import 'package:realestate/data/static/categorydata.dart';
import 'package:realestate/view/widget/Coustom_Text_Form_Field.dart';
import 'package:realestate/view/widget/auth/coustombuttonauth.dart';
import 'package:realestate/view/widget/mainpage/coustomcategory.dart';
import 'package:realestate/view/widget/mainpage/coustomphoto.dart';
import 'package:get/get.dart';
import '../../controller/mainpagecontroller.dart';
import '../widget/auth/customtextformauth.dart';
import '../widget/imageslider.dart';
import '../widget/mainpage/coustonbuttom.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MainScreenController controller =Get.put(MainScreenController());
    return Scaffold(
      backgroundColor: Color(0xffE2FFFFFF),
      drawer: Drawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "الرئيسية",
          style: TextStyle(color: AppColors.greencolor, fontFamily: "Tejwal"),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notification_add_outlined,
              ))
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            CoustomPhoto(),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CoustomBottom(title: "عرض الكل", onpress: () {}),
                      Text(
                        "العقارات",
                        style: TextStyle(
                            color: Color(0xff483d8b),
                            fontSize: 15.sp,
                            fontFamily: "TejwalBold"),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                  SizedBox(
                    height: 190.sp,
                    child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: CategoryData().data.length,
                        gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          childAspectRatio: 1.sp,
                          crossAxisSpacing: 7.sp,
                          mainAxisSpacing: 30.sp,
                        ),
                        itemBuilder: (context, index) {
                          var data = CategoryData().data[index];
                          return InkWell(
                            onTap: () {
                              controller.gotodetailsscreen(data.tybe);

                            },
                            child: CoustomCategory(
                               imageurl: data.imageurl,title: data.title,),
                          );
                        }),
                  ),
                ],
              ),
            ),
            ImageSlider(imageUrls: controller.imageurl,)
          ],
        ),
      ),
    );
  }
}
