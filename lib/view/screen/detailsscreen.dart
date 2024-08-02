import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:realestate/core/class/handlingrequstveiw.dart';
import 'package:realestate/core/constanat/colors.dart';
import 'package:realestate/data/models/propertymodel.dart';
import 'package:realestate/data/static/onbordring.dart';
import 'package:realestate/view/widget/coustomimage.dart';

import '../../controller/details_controllers/detialscontroller.dart';
import '../widget/property_card.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DetailsController detailsController = Get.put(DetailsController());
    return Scaffold(

        backgroundColor:const Color(0xF3F3F3E7),
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
          iconTheme:const IconThemeData(color: Colors.grey),
          actions: [
            IconButton(
                onPressed: () {}, icon:const Icon(Icons.notification_add_outlined))
          ],
        ),
        body: GetBuilder<DetailsController>(
          builder: (controller) {
            return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:controller.data==null?Center(child: CircularProgressIndicator()): GridView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: controller.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.53,
                            mainAxisSpacing: 0.5,
                            crossAxisSpacing: 11),
                    itemBuilder: (context, index) {
                      PropertyModel data = controller.data[index];
                      return InkWell(
                        onTap: () {
                          controller.goToPropertyDetails(data.slug!);
                        },
                        child:CoustomPropertyCard(
                          cover: data.coverPhoto!,
                          title: data.title == null ? "" : data.title!,
                          street: data.location!.street == null
                              ? ""
                              : data.location!.street!,
                          location: data.location!.city == null
                              ? ""
                              : data.location!.city!,
                          price: " ${data.price}",
                          isfav: true,
                           onFavPressed: () {  }, onDeletePressed: () {  }, onUpdatePressed: () { },
                        )
                      );
                    }));
          },
        ));
  }
}
