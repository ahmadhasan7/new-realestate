import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/userProprty/user_property_controller.dart';
import '../../../core/class/handlingrequstveiw.dart';
import '../../../core/constanat/colors.dart';
import '../../../data/models/propertymodel.dart';
import '../../widget/property_card.dart';

class UserProperty extends StatelessWidget {
  const UserProperty({super.key});

  @override
  Widget build(BuildContext context) {
    UserPropertyController controller = Get.put(UserPropertyController());
    return Scaffold(
      backgroundColor: const Color(0xF3F3F3E7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "عقاراتي",
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
            icon: const Icon(Icons.notification_add_outlined),
          ),
        ],
      ),
      body: GetBuilder<UserPropertyController>(
        builder: (controller) {
          return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: controller.data.isEmpty
                ? const Center(child: Text("لا يوجد عقارات لعرضها"))
                : GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: controller.data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.53,
                mainAxisSpacing: 0.5,
                crossAxisSpacing: 11,
              ),
              itemBuilder: (context, index) {
                PropertyModel data = controller.data[index];
                return InkWell(
                  onTap: () {
                    controller.goToDetailsProperty(data);
                  },
                  child: CoustomPropertyCard(
                    cover: data.coverPhoto!,
                    title: data.title ?? "",
                    street: data.location?.street ?? "",
                    location: data.location?.city ?? "",
                    price: " ${data.price}",
                    isfav: false, onFavPressed: () {  }, onDeletePressed: () {
                      controller.deleteProperty(data.slug!,index);
                  }, onUpdatePressed: () {
                      controller.goToUpdateScreen(data);
                  },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}