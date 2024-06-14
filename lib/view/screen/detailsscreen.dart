import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/core/class/handlingrequstveiw.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/data/models/propertymodel.dart';
import 'package:realestate/data/static/onbordring.dart';
import 'package:realestate/view/widget/coustomimage.dart';

import '../../controller/detialscontroller.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.put(DetailsController());
    return Scaffold(
        backgroundColor: Color(0xF3F3F3E7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "القعارات",
            style: TextStyle(
              color: AppColors.greencolor,
              fontFamily: "Tejwal",
            ),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notification_add_outlined))
          ],
        ),
        body: GetBuilder<DetailsController>(
          builder: (controller) {
            return HandlingDataView(statusRequest: controller.statusRequest, widget: GridView.builder(
                padding: EdgeInsets.all(10),
                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.53,
                    mainAxisSpacing: 0.5,
                    crossAxisSpacing: 11),
                itemBuilder: (context, index) {
                  PropertyModel data=controller.data[index];
                  return InkWell(
                    onTap: (){controller.goToPropertyDetails(data.slug!);},
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: MediaQuery.of(context).size.width / 2,
                          height: 280.sp,
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  CoustomCachedImage(imageurl: data.coverPhoto!, height: 150.sp, width: double.infinity),
                                  Positioned(
                                    left: 110.sp,
                                    top: 10.sp,
                                    child: Container(
                                      width: 50.sp,
                                      height: 50.sp,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(25)),
                                      child: IconButton(
                                        icon: Icon(Icons.favorite_border),
                                        onPressed: () {},
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.sp,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade100,
                                              borderRadius:
                                              BorderRadius.circular(10)),
                                          child:  Text(
                                            data.title!.substring(0,6),
                                            style: TextStyle(
                                                color: AppColors.greencolor),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              child:const  Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                  Text(
                                                    "4.5",
                                                    style: TextStyle(
                                                        color:
                                                        AppColors.greencolor),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.sp,
                                    ),
                                    Text(
                                      data.location!.street!,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "TejwalBold"),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_history,
                                          color: AppColors.greencolor,
                                        ),
                                        Text(
                                          data.location!.city!,
                                          style: TextStyle(
                                              color: AppColors.greencolor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${data.price}",
                                          style: TextStyle(
                                              color: AppColors.greencolor,
                                              fontFamily: "TejwalBold"),
                                        ),
                                        Text(
                                          "السعر النهائي:  ",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontFamily: "Tejwal"),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }));
          },
        ));
  }
}
