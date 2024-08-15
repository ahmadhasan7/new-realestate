import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/my_favorite_controller.dart';
import '../../core/class/handlingrequstveiw.dart';
import '../../core/constanat/colors.dart';
import '../../data/models/propertymodel.dart';
import '../widget/coustom_card_handling.dart';
import '../widget/favorite/coustom_card_fav.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavoriteController controller = Get.put(MyFavoriteController());
    return Scaffold(
      backgroundColor: const Color(0xF3F3F3E7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "المفضلة",
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
              icon: const Icon(Icons.notification_add_outlined)),
        ],
      ),
      body: Obx(() {
        return HandlingDataViewShimmer(
          shimmerwidget: CoustomCardHandling(),
          statusRequest: controller.favoriteController.statusRequest.value,
          widget: controller.favoriteController.data.isEmpty
              ? const Center(child: Text("المفضلة فارغة"))
              : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: controller.favoriteController.data.length,
            itemBuilder: (context, index) {
              PropertyModel data = controller.favoriteController.data[index];
              return InkWell(
                onTap: () {
                  controller.goToPropertyDetails(data.slug!);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CoustomFavoriteCard(
                    cover: data.coverPhoto!,
                    title: data.title ?? "",
                    street: data.location?.street ?? "",
                    location: data.location?.city ?? "",
                    price: " ${data.price}",
                    onDeletePressed: () {
                      controller.deletePropertyFromFav(index, data.id!);
                    },

                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
