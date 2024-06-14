import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/view/widget/addproperty/cousotomgallaryphoto.dart';
import 'package:realestate/view/widget/addproperty/coustomphotocard.dart';

import '../../../controller/addPropertyController.dart';
import '../../../core/constanat/colors.dart';

class AddProperyPhotos extends StatelessWidget {
  const AddProperyPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    AddPropertyController controller = Get.put(AddPropertyController());
    return Scaffold(
        bottomNavigationBar: Container(
          color: AppColors.greencolor,
          width: double.infinity,
          height: 50.sp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                onPressed: (){controller.removepage();},
                child:const Text(
                  "إلغاء",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: (){controller.nextpage();},
                child:const Text(
                  "التالي",
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "إضافــة عقــار",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.greencolor,
          centerTitle: true,
        ),
        body: GetBuilder<AddPropertyController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller.pickImages();
                    },
                    child:const Text(
                      "أختر الصور",
                      style: TextStyle(fontFamily: "Tejwal"),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 2),
                    itemBuilder: (context, index) {
                      if (index < controller.selectedImages.length) {
                        if (index < controller.selectedImages.length) {
                          return CoustomGallaryPhoto(
                            imageurl: controller.selectedImages[index],
                            removephoto: () {
                              controller.removephoto(index);
                            },
                          );
                        }
                        return const CoustomPhotoCard();
                      } else {
                        return const  CoustomPhotoCard();
                      }
                    },
                  )
                ],
              ),
            );
          },
        ));
  }
}
