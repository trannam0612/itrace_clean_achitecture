import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrace_247/config/utils/colors.dart';

Widget customSliderWidget(BuildContext context, {required double value}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(4.0),
    child: SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 8.h,
        thumbColor: Colors.transparent,
        trackShape: const RoundedRectSliderTrackShape(),
        activeTrackColor:
            value == 20 ? ColorsConstant.c0A89FE : ColorsConstant.c00C753,
        inactiveTrackColor: ColorsConstant.cF9F9F9,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 0.0),
        overlayShape: SliderComponentShape.noThumb,
      ),
      child: Slider(
        value: value,
        min: 0,
        max: 100,
        divisions: 100,
        // label: currentSliderValue.round().toString(),
        onChanged: (double value) {},
      ),
    ),
  );
}
