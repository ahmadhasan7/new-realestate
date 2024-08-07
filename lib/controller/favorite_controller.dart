import 'package:get/get.dart';
import 'package:realestate/core/class/stutusconntection.dart';
import 'package:realestate/core/services/services.dart';
import 'package:realestate/data/remote/favorite_data.dart';
import '../core/functions/handingdatacontroller.dart';
import '../data/models/propertymodel.dart';

class FavoriteController extends GetxController {
  MyServices myServices = Get.find();
  var statusRequest = StatusRequest.none.obs; // Make it observable
  FavoriteData favoriteData = FavoriteData(Get.find());
  var isfavorite = {}.obs;
  var data = <PropertyModel>[].obs;

  setFavarie(String slug, bool isfav) {
    isfavorite[slug] = isfav;
    update();
  }

  deleteFromFav(String propertyid) async {
    var response = await favoriteData.deleteFavorite(
        propertyid, myServices.pref.getString('token')!);
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.seccess) {
      Get.snackbar("تمت", "تم حذف العقار من المفضلة");
    }
    update();
  }

  addToFav(String propertyid) async {
    var response = await favoriteData.addFavorite(
        propertyid, myServices.pref.getString('token')!);
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.seccess) {
      Get.snackbar("تمت", "تم إضافة العقار للمفضلة");
    }
    update();
  }

  getUserFavorite() async {
    statusRequest.value = StatusRequest.loading;
    update();
    var response = await favoriteData.getUserFavorites(
        myServices.pref.getString('token')!);
    statusRequest.value = handlingData(response);
    if (statusRequest.value == StatusRequest.seccess) {
      data.value = (response as List).map((item) => PropertyModel.fromJson(item['property'])).toList();
    }
    update();
  }
}
