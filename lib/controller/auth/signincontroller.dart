
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/staticdata.dart';
import '../../core/class/stutusconntection.dart';
import '../../core/constanat/routing.dart';
import '../../core/functions/handingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/remote/auth/signin.dart';
import '../personal_info_controller.dart';

abstract class SignIncontroller extends GetxController{
  signin();
  forgetpassword();
  signinwithlinkedin();
  signinwithfacebook();
  signinwithinsta();
  gotoforgetpassword();
  gotosignup();
}
class SignInContollerImp extends SignIncontroller{

  late TextEditingController email;
  late TextEditingController password;
  SignInData signindata=SignInData(Get.find());
  List<Map<String,dynamic>> data=[];
  MyServices services=Get.find();
  String? userid;
  StatusRequest statusRequest=StatusRequest.none;
  @override
  void onInit() {
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  signin() async{
    statusRequest = StatusRequest.loading;
    update() ;
    var response = await signindata.PostSignUpdata(email.text,password.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    update() ;
    print(statusRequest);
    if (statusRequest == StatusRequest.seccess) {
      Get.toNamed(AppRoute.homepage);
      myServices.pref.setString('token', response['token']);
      myServices.pref.setString("login","1");
    }
    else{
      print(response);
      Get.defaultDialog(title: "تحذير" , middleText: "البريد الالكتروني او كلمة السر خاطئ") ;
      print(statusRequest);
      statusRequest = StatusRequest.failure;
      update();
    }
    update();
  }

  @override
  signinwithfacebook() {
  }

  @override
  signinwithinsta() {
  }

  @override
  signinwithlinkedin() {
  }
  @override
  gotoforgetpassword() {

    Get.toNamed(AppRoute.forgetpassword);  }


  @override
  forgetpassword() {
    // TODO: implement forgetpassword
    throw UnimplementedError();
  }

  @override
  gotosignup() {
    Get.toNamed(AppRoute.signup);
  }
}