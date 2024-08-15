import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/favorite_controller.dart';
import 'package:realestate/core/class/handlingrequstveiw.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/data/models/propertymodel.dart';
import 'package:realestate/view/widget/coustom_guest_dialog.dart';
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
      //  backgroundColor: const Color(0xF3F3F3E7),
        appBar: AppBar(
          //backgroundColor: Colors.white,
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
                onPressed: () {
                  detailsController.goToCoustomizeSearchScreen();
                },
                icon: const Icon(Icons.filter_list))
          ],
        ),
        body: GetBuilder<DetailsController>(
          builder: (controller) {
            return Column(
              children: [
                Container(

                  color: Colors.white,
                  padding:const  EdgeInsets.all(15),
                  height: 100,
                  child: ListView.builder(
                    itemCount: controller.category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var m = controller.category[index];

                      return InkWell(
                        onTap: () {
                          controller.changePart(index,m);
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: controller.index == index
                                  ? const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 3,
                                        color: AppColors.greencolor)),
                              )
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  m,
                                  style:  TextStyle(
                                    color: controller.index==index?AppColors.greencolor:Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    fontFamily: "Tejwal"
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: HandlingDataViewShimmer(
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
                                              if(controller.myServices.pref!.getString('token')==null){
                                                showCoustomDialog();
                                              }
                                              else{
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
                                                }
                                              }

                                            },
                                            onDeletePressed: () {},
                                            onUpdatePressed: () {}, istrad: data.propertyStatus==null?"": data.propertyStatus!, ownertybe:data.furnishing==null?"": data.furnishing!,
                                          ));
                                    });
                                  })
                              : Center(
                                  child: Text('لا يوجد عقارات مضافة لعرضها'),
                                )),
                ),
              ],
            );
          },
        ));
  }
}
