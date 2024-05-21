import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realestate/core/constanat/colors.dart';

import '../../../controller/onbordingcontoller.dart';

class CoustomElevetedButtomOnBording extends GetView<OnBordingControll> {
  const CoustomElevetedButtomOnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 60),
          textColor: Colors.white,
          color: AppColors.greencolor,
          onPressed: () {
            controller.next();
          },
          child: Text("التالي",style: TextStyle(fontFamily: "Tejwal"),),

        ));

  }
}
