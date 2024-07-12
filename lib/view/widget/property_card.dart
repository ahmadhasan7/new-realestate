import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constanat/colors.dart';
import 'coustomimage.dart';

class CoustomPropertyCard extends StatelessWidget {
  final String cover;
  final String title;
  final String street;
  final String location;
  final String price;
  final bool isfav;
  final void Function() onPressed;

  const CoustomPropertyCard(
      {super.key,
      required this.cover,
      required this.title,
      required this.street,
      required this.location,
      required this.price,
      required this.isfav, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      width: MediaQuery.of(context).size.width / 2,
      height: 280.sp,
      child: Column(
        children: [
          Stack(
            children: [
              cover != null
                  ? CoustomCachedImage(
                      imageurl: cover, height: 150.sp, width: double.infinity)
                  : Container(
                      height: 150.sp,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(15.sp)),
                    ),
              Positioned(
                  left: 110.sp,
                  top: 10.sp,
                  child: isfav
                      ? Container(
                          width: 50.sp,
                          height: 50.sp,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: IconButton(
                            icon: Icon(Icons.favorite_border),
                            onPressed: onPressed,
                          ),
                        )
                      : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: onPressed,
                      ))
            ],
          ),
          SizedBox(
            height: 10.sp,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          title,
                          style: const TextStyle(color: AppColors.greencolor),
                        )),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(color: AppColors.greencolor),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10.sp,
                ),
                Text(
                  street,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "TejwalBold"),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_history,
                      color: AppColors.greencolor,
                    ),
                    Text(
                      location,
                      style: const TextStyle(color: AppColors.greencolor),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                          color: AppColors.greencolor,
                          fontFamily: "TejwalBold"),
                    ),
                    const Text(
                      "السعر النهائي:  ",
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontFamily: "Tejwal"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
