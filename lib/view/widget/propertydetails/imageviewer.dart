import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realestate/view/widget/coustomimage.dart';
class ImageViewer extends StatefulWidget {
  final List<String> imageUrls;
  List<String> imageurl=[
    "Assets/images/ard.jpg",
    "Assets/images/bayt.jpg",
    "Assets/images/benaa.jpg",
    "Assets/images/fela.jpg",
    "Assets/images/mahl.jpg",
    "Assets/images/maktab.jpg",
  ];
  ImageViewer({required this.imageUrls});

  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CarouselSlider(
              items: widget.imageurl.map((url) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      url,
                      width: double.infinity,
                      height: 100.sp,
                      fit: BoxFit.cover,
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.4,
                viewportFraction: 1.0,
                onPageChanged: (index, _) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(widget.imageUrls.length, (index) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.white
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}
