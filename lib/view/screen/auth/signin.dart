import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signincontroller.dart';
import '../../../core/class/handlingrequstveiw.dart';
import '../../../core/constanat/colors.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/coustombuttonauth.dart';
import '../../widget/auth/customtextformauth.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInContollerImp());
    return Scaffold(

        backgroundColor: Colors.grey.shade100,
        body: GetBuilder<SignInContollerImp>(
          builder: (contoller) {
            return CoustomHandlingData(
                statusRequest: contoller.statusRequest,
                widget: ListView(
                  padding: EdgeInsets.all(14),
                  children: [
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
                            "تسجيل الدخول",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.greencolor,
                                fontSize: 25.sp,
                                fontFamily: "TejwalBold"),
                          ),
                          Text(
                            "قم بتسجيل الدخول للمتابعة",
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
                          hinttext: 'البريد الاكتروني',
                          mycontroller: contoller.email,
                          valid: (val) {
                            validInput("email", 10, 10, val!);
                          },
                          isNumber: false,
                          icons: Icon(Icons.person),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),

                        CustomTextFormAuth(
                          hinttext: 'كلمة السر',
                          mycontroller: contoller.password,
                          valid: (val) {
                            validInput("password", 10, 10, val!);
                          },
                          isNumber: false,
                          icons: Icon(Icons.password),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  contoller.gotoforgetpassword();
                                },
                                child: const Text(
                                  "اضغط هنا",
                                  style:
                                      TextStyle(color: AppColors.orangecolor),
                                )),
                            const Text(
                              "هل نسيت كلمة السر؟",
                              style: TextStyle(color: AppColors.greencolor),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  contoller.gotosignup();
                                },
                                child: const Text(
                                  "اضغط هنا",
                                  style:
                                  TextStyle(color: AppColors.orangecolor),
                                )),
                            const Text(
                              "أليس لديك حساب؟",
                              style: TextStyle(color: AppColors.greencolor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    CoustomButtom(
                        title: "تسجيل الدخول",
                        onpress: () {
                          contoller.signin();
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
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
                ));
          },
        ));
  }
}
