import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/controller/filters/filtered_property_controller.dart';
import 'package:realestate/controller/userProprty/user_property_controller.dart';
import 'package:realestate/view/widget/coustom_card_handling.dart';
import '../../../core/class/handlingrequstveiw.dart';
import '../../../core/constanat/colors.dart';
import '../../../data/models/propertymodel.dart';
import '../../widget/property_card.dart';

class FilteredPropertyScreen extends StatelessWidget {
  const FilteredPropertyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FilteredPropertyController controller = Get.put(FilteredPropertyController());
    return Scaffold(
      backgroundColor: const Color(0xF3F3F3E7),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "نتائج البحث",
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
      body:controller.data.isEmpty
          ? const Center(child: Text("لا يوجد عقارات لعرضها"))
          : ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: controller.data.length,
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
              //controller.deleteProperty(data.slug!,index);
            }, onUpdatePressed: () {
              //controller.goToUpdateScreen(data);
            }, isuserproperty: true, istrad: '', ownertybe: '',
            ),
          );
        },
      ),


    );
  }
}