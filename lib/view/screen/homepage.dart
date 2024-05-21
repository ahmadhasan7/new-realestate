import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homepagecontroller.dart';
import '../../core/constanat/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageControllerImp homePageControllerImp =
        Get.put(HomePageControllerImp());
    return GetBuilder<HomePageControllerImp>(builder:(controller){
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: homePageControllerImp.bottomNavigationKey,
          index: 0,
          items: [
            CurvedNavigationBarItem(
              child: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.favorite_border),
              label: 'المفضلة',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.add_shopping_cart),
              label: 'سلة المشتريات',
            ),
            CurvedNavigationBarItem(
              child: Icon(Icons.control_point),
              label: 'إضافة عقار',
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor:AppColors.greencolor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            homePageControllerImp.onpress(index);
          },
          letIndexChange: (index) => true,
        ),
        body: homePageControllerImp.pages[homePageControllerImp.page],





      );
    } );
  }
}
