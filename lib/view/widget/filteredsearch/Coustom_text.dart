import 'package:flutter/material.dart';

class CoustomText extends StatelessWidget {
  final String? data;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontWeight;
  final AlignmentGeometry? align;

  const CoustomText({this.data, this.color=Colors.black, this.fontsize=12, this.align=Alignment.topLeft, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
        child: Text(
      data!,
      style: TextStyle(color: color, fontSize: fontsize,fontWeight: fontWeight),
    ));
  }
}
