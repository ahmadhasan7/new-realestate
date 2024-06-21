import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup.dart';
import '../../../core/class/handlingrequstveiw.dart';
import '../../../core/constanat/colors.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/coustombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpContollerImp());
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: GetBuilder<SignUpContollerImp>(
          builder: (contoller) =>              HandlingDataRequest(
            statusRequest: contoller.statusRequest,
            widget: ListView(
              padding: EdgeInsets.all(14),
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                Image.asset(
                  "Assets/images/CoustomLogo.PNG",
                  color: AppColors.greencolor,
                  height: 100.sp,
                  width: 100.sp,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Center(
                  child: Column(
                    children: [
                      Text(
                        "انشاء الحساب",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.greencolor,
                            fontSize: 25.sp,
                            fontFamily: "TejwalBold"),
                      ),
                      Text(
                        "قم بإنشاء الحساب  للمتابعة",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                  CustomTextFormAuth(
                  hinttext: 'اسم الأول',
                  mycontroller: contoller.firstname,
                  valid: (val) {
                    validInput("username", 10, 10, val!);
                  },
                  isNumber: false,
                  icons: Icon(Icons.person),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
                    CustomTextFormAuth(
                      hinttext: 'اسم الأخير',
                      mycontroller: contoller.lastname,
                      valid: (val) {
                        validInput("username", 10, 10, val!);
                      },
                      isNumber: false,
                      icons: Icon(Icons.person),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

              CustomTextFormAuth(
                hinttext: 'البريد الالكتروني',
                mycontroller: contoller.email,
                valid: (val) {
                  validInput("email", 10, 10, val!);
                },
                isNumber: false,
                icons: Icon(Icons.email),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ), CustomTextFormAuth(
                      hinttext: 'كلمة السر',
                      mycontroller: contoller.password,
                      valid: (val) {
                        validInput("phone", 10, 10, val!);
                      },
                      isNumber: true,
                      icons: Icon(Icons.phone),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    CustomTextFormAuth(
                      hinttext: 'اعادة كلمة السر ',
                      mycontroller: contoller.conipassword,
                      valid: (val) {
                        validInput("password", 10, 10, val!);
                      },
                      isNumber: false,
                      icons: Icon(Icons.password),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                      ],
                    ),
                CoustomButtom(title: "إنشاء الحساب", onpress: (){contoller.signUp();}),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "أو يمكنك تسجل الدخول من خلال",
                        style: TextStyle(
                            fontSize: 15,
                            color: AppColors.greencolor,
                            fontFamily: "Tejwa;"),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              contoller.signinwithfacebook();
                            },
                            child: Image.asset(
                              "Assets/images/Facebook_Logo_(2019).png",
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              contoller.signinwithlinkedin();
                            },
                            child: Image.asset(
                              "Assets/images/LinkedIn_icon.svg.png",
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                          SizedBox(
                            width: 15.sp,
                          ),
                          InkWell(
                            onTap: () {
                              contoller.signinwithinsta();
                            },
                            child: Image.asset(
                              "Assets/images/new-Instagram-logo-png-full-colour-glyph.png",
                              width: 25.sp,
                              height: 25.sp,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
                  ],
                ),




        )));
  }
}
