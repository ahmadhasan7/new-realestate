import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/favorite_controller.dart';
import 'package:realestate/core/class/handlingrequstveiw.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/data/models/propertymodel.dart';

import '../../controller/details_controllers/detialscontroller.dart';
import '../widget/coustom_card_handling.dart';
import '../widget/property_card.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.put(DetailsController());
    final favcontroller = Get.put(FavoriteController());
    return Scaffold(
        backgroundColor: const Color(0xF3F3F3E7),
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
          iconTheme: const IconThemeData(color: Colors.grey),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notification_add_outlined))
          ],
        ),
        body: GetBuilder<DetailsController>(
          builder: (controller) {
            return HandlingDataViewShimmer(
                shimmerwidget:const CoustomCardHandling(),
                statusRequest: controller.statusRequest,
                widget: controller.data == null
                    ?const  CoustomCardHandling()
                    : controller.data.isNotEmpty
                        ? ListView.builder(
                            padding: EdgeInsets.all(10),
                            itemCount: controller.data.length,

                            itemBuilder: (context, index) {
                              PropertyModel data = controller.data[index];
                              favcontroller.setFavarie(
                                  data!.id!, data!.isFavorite!);
                              return GetBuilder<FavoriteController>(
                                  builder: (controller) {
                                return InkWell(
                                    onTap: () {
                                      detailsController
                                          .goToPropertyDetails(data.slug!);
                                    },
                                    child: CoustomPropertyCard(
                                      isuserproperty: false,
                                      cover: data.coverPhoto!,
                                      title:
                                          data.title == null ? "" : data.title!,
                                      street: data.location!.street == null
                                          ? ""
                                          : data.location!.street!,
                                      location: data.location!.city == null
                                          ? ""
                                          : data.location!.city!,
                                      price: " ${data.price}"==null?"":"${data.price}",
                                      isfav: favcontroller.isfavorite[data.id],
                                      onFavPressed: () {
                                        print(
                                            favcontroller.isfavorite[data.id]);
                                        if (favcontroller.isfavorite[data.id] ==
                                            true) {
                                          favcontroller.setFavarie(
                                              data.id!, false);
                                          controller.deleteFromFav(data.id!);
                                          print(favcontroller
                                              .isfavorite[data.id]);
                                        } else {
                                          favcontroller.setFavarie(
                                              data.id!, true);
                                          controller.addToFav(data.id!);
                                          print(favcontroller
                                              .isfavorite[data.id]);
                                        }
                                      },
                                      onDeletePressed: () {},
                                      onUpdatePressed: () {}, istrad: data.propertyStatus==null?"": data.propertyStatus!, ownertybe:data.propertyStatus==null?"": data.propertyStatus!,
                                    ));
                              });
                            })
                        : Center(
                            child: Text('لا يوجد عقارات مضافة لعرضها'),
                          ));
          },
        ));
  }
}
