import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpassword/forgetpasswordcontroller.dart';
import '../../../../core/class/handlingrequstveiw.dart';
import '../../../../core/constanat/colors.dart';
import '../../../../core/functions/validetor.dart';
import '../../../widget/auth/coustombuttonauth.dart';
import '../../../widget/auth/customtextformauth.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controllerImp =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greencolor,
        title:const  Text(
          "هل نسيت كلمة السر؟",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Tejwal",
          ),
        ),
        ),
      body:GetBuilder<ForgetPasswordControllerImp>(builder: (controllerImp){
        return HandlingDataRequest(statusRequest: controllerImp.statusRequest, widget:  Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Center(
                  child: Text(
                    "ادخل رقم الهاتف",
                    style: TextStyle(
                        color: AppColors.greencolor,
                        fontFamily: "Tejwal",
                        fontSize: 25),
                  )),
              CustomTextFormAuth(
               icons: Icon(Icons.phone),
                hinttext: 'رقم الهاتف',
                mycontroller: controllerImp.phone,
                valid: (val) {
                  Validetor("phone", 3, 10, val!);
                },
                isNumber: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              CoustomButtom(title: "تأكيد", onpress:(){
                controllerImp.ForgetPassword();
              } )
            ],
          ),
        ),);
      },)
    );
  }
}
