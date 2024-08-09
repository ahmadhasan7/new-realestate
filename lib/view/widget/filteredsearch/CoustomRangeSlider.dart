import 'package:flutter/material.dart';

import '../../../core/constanat/colors.dart';

class CoustomRangeSlider extends StatelessWidget {
  final RangeValues selectedRange;
  final ValueChanged<RangeValues> onChanged;
  final bool isEnabled; // Add this parameter

  const CoustomRangeSlider({
    Key? key,
    required this.selectedRange,
    required this.onChanged,
    required this.isEnabled, // Add this parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      activeColor: isEnabled ? AppColors.greencolor : Colors.grey, // Change color based on enabled/disabled state
      inactiveColor: isEnabled ? Colors.grey[300] : Colors.grey, // Change inactive color
      min: 10,
      max: 10000,
      values: selectedRange,
      onChanged: isEnabled ? onChanged : null, // Enable/Disable slider
    );
  }
}
