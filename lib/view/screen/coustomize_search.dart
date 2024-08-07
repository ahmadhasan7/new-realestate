import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:realestate/controller/coustomize_search_controller.dart';

import '../../core/constanat/colors.dart';

class CoustomizeSearch extends StatelessWidget {
  const CoustomizeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CoustomizeSearchController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "البحث المخصص",
          style: TextStyle(
            color: AppColors.greencolor,
            fontFamily: "Tejwal",
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
           Column(
            children: [
           const   SizedBox(
                height: 10,
              ),
             const Center(
                  child: Icon(
                Icons.notification_add,
                size: 200,
              )),
             const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "يمكنك تحديد بحث مخصص لك ومن خلاله عند توافر طلبك سيتم اخبارك باشعار مخصص لك! كيفية الاستخدام : سيظهر أمامك قائمة منسدلة تحتوي على مواضيع مختلفة...",
                  style: TextStyle(fontFamily: "Tejwal", fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              ElevatedButton(onPressed: (){_controller.goToselectSearchscreen();}, child:const  Row(mainAxisAlignment:MainAxisAlignment.center,children: [
                 Text("لنبدأ",style: TextStyle(color: AppColors.greencolor,fontFamily: "Tejwal"),),
                 Icon(Icons.arrow_forward_ios,color: AppColors.greencolor,),
              ],))
            ],
          ),
          Positioned(
            left: 50,
            top: 110,
            child: Obx(
              () => _controller.showWidget.value
                  ? Stack(
                    children: [
                      BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ),
                      Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            width: 300,
                            height: 300,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'مرحبا',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontFamily: "Tejwal"),
                                    ),
                                    const Text(
                                      ' قم بتخصيص بحثك لتلقي جميع التحديثات والإشعارات المتعلقة بهذا الموضوع.',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,

                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    ElevatedButton(
                                      onPressed: _controller.dismissWidget,
                                      child: Padding(padding:EdgeInsets.all(20),child: Text('تم')),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                  : const SizedBox.shrink(),
            ),
          ),
          Positioned(
            top: 360.h,
            left: 50.w,
            child: Container(
              child: Image.asset(
                "Assets/images/123.png",
                height: 300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
