import 'package:get/get.dart';
import 'package:realestate/controller/favorite_controller.dart';

import '../core/constanat/routing.dart';
class MyFavoriteController extends GetxController {
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void onInit() {
    favoriteController.getUserFavorite();
    super.onInit();
  }

  deletePropertyFromFav(int index, String propertyid) {
    favoriteController.deleteFromFav(propertyid);
    favoriteController.data.removeAt(index);
    update();
  }

  goToPropertyDetails(String slug) {
    Get.toNamed(AppRoute.propertdetailsscreen, arguments: slug);
  }
}
