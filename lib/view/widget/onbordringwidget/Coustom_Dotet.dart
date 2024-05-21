import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/colors.dart';

import '../../../controller/onbordingcontoller.dart';
import '../../../data/static/onbordring.dart';



class CoustomDotet extends StatelessWidget{
  const CoustomDotet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBordingControll>(builder: (controller){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
          ),
          ...List.generate(
            data.length,
                (index) => AnimatedContainer(
              margin: EdgeInsets.only(right: 6),
              duration: Duration(milliseconds: 500),
              width: controller.currentindex==index?16.0:8.0,
              height: 8,
              decoration: BoxDecoration(
                color: controller.currentindex==index?AppColors.greencolor:Colors.black26,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          )
        ],
      );
    });
  }
}
