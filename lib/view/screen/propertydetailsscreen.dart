import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:realestate/core/class/handlingrequstveiw.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/view/widget/propertydetails/coustomdatadetails.dart';
import 'package:realestate/view/widget/propertydetails/coustomlabel.dart';
import 'package:realestate/view/widget/propertydetails/imageviewer.dart';
import '../../controller/details_controllers/propertydetailscontroller.dart';
import '../widget/propertydetails/coustom_handling_data_property.dart';
class PropertyDetailsScreen extends StatelessWidget {
  const PropertyDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    PropertyDetailsController controller = Get.put(PropertyDetailsController());
    return Scaffold(
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 45.sp,
          child: GestureDetector(
            onTap: () {
              if (controller.data?.phoneNumber != null) {
                controller.callwithphone(controller.data!.phoneNumber!);
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.phone,
                  color: AppColors.greencolor,
                ),
                SizedBox(
                  width: 10.sp,
                ),
                const Text("التواصل مع المالك")
              ],
            ),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: const Text(
            "تفاصيل العقار",
            style: TextStyle(
                fontFamily: "TejwalBold", fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<PropertyDetailsController>(
            builder: (controller) {
              return HandlingDataViewShimmer(
                shimmerwidget:CoustomhandlingDataPropertyDetails(),
                statusRequest: controller.statusRequest,
                widget:controller.data==null?CoustomhandlingDataPropertyDetails():Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        controller.data == null
                            ? Center(child: Text("لا يوجد بيانات لعرضها"))
                            : ImageViewer(
                          imageUrls: controller.imageurl,
                        ),
                        SizedBox(
                          height: 10.sp,
                        ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {},
                        child:const  Row(
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
                        controller.data!.propertyStatus!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CoustomLabel(label: "${controller.data!.price}"),
                    const SizedBox(
                      height: 15,
                    ),
                    const CoustomLabel(label: "وصف العقار"),
                    Text("${controller.data!.description}",
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
                            ammount: "${controller.data!.plotArea}"),
                       controller.data!.propertyStatus=='للأجار'? Divider(
                          color: Colors.grey.shade100,
                        ):Container(),
                        controller.data!.propertyStatus=='للأجار'?CoustomDataDetails(
                            imageurl: "Assets/images/88.png",
                            title: "نوع الأجار",
                            ammount: "${controller.data!.rentType}"):Container(),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/8.png",
                            title: "رقم الطابق",
                            ammount: "${controller.data!.floorNumber}"),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/8888888.png",
                            title: "نوع الملكية",
                            ammount: "${controller.data!.ownershipType}"),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/125126-200.png",
                            title: "عدد الغرف ",
                            ammount: "${controller.data!.totalFloors}"),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/125126-200.png",
                            title: "عدد المطابخ",
                            ammount: "${controller.data!.kitchens}"),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/125126-200.png",
                            title: "عدد غرف المعيشة",
                            ammount: "${controller.data!.livingRooms}"),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/125126-200.png",
                            title: "عدد غرف النوم",
                            ammount: "${controller.data!.bedrooms}"),

                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/888.png",
                            title: "نوع البائع",
                            ammount: controller.data!.userType!),
                        Divider(
                          color: Colors.grey.shade100,
                        ),
                        CoustomDataDetails(
                            imageurl: "Assets/images/8888.png",
                            title: "الفرش",
                            ammount: controller.data!.furnishing!),
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
                        ammount: controller.data!.location!.city!),
                    Divider(
                      color: Colors.grey.shade100,
                    ),

                    CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "المنطقة",
                        ammount: controller.data!.location!.region!),
                    Divider(
                      color: Colors.grey.shade100,
                    ),

                    CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "الشارع",
                        ammount: controller.data!.location!.street!),

                    Divider(
                      color: Colors.grey.shade100,
                    ),
                    CoustomLabel(label: "ميزات إضافية"),
                    SizedBox(height: 10.sp,),
                    controller.data!.elevator!?const CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "مصعد",
                        ammount: "1"):Container(),

                    controller.data!.pool!?const CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "مسبح",
                        ammount: "1"):Container(),
                    SizedBox(height: 10.sp,),
                  const   CoustomLabel(label: "تفاصيل الإعلان"),
                    SizedBox(height: 10.sp,),
                     CoustomDataDetails(
                        imageurl: "Assets/images/8888888.png",
                        title: "تاريخ النشر",
                        ammount:Jiffy.parse(controller.data!.createdAt!).format(pattern: 'MMMM do yyyy, ')
                      ),
                  ],
                )
              ],
            ),
          ),
        ),
              );}));

  }
}
