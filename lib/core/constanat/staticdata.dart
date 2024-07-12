import 'package:get/get.dart';
import 'package:realestate/core/services/services.dart';

MyServices myServices=Get.find();
class Staticdata{
  static String? token=myServices.pref.getString('token');

}