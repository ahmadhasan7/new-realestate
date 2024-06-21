import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/onbordringwidget/CoustomElevetedButtom.dart';
import '../../widget/onbordringwidget/Coustom_Dotet.dart';
import '../../widget/onbordringwidget/Coustom_Slider.dart';
import '/controller/onbordingcontoller.dart';

class OnBordringScreen extends StatelessWidget {
  const OnBordringScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBordingControll());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: CoustomSliderOnBordring(),
              flex: 3,
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child:  Container(
                  child: const Column(
                    children: [
                       CoustomDotet(),
                       SizedBox(height: 20), // Adjusted the SizedBox height
                       CoustomElevetedButtomOnBording(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
