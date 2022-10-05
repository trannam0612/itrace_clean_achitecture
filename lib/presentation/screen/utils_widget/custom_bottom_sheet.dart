import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';



Future<dynamic> showCustomBottomSheet({
  required BuildContext context,
  required Widget widget,
}) {
  return showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.w),
            ),
            isScrollControlled: true,
            backgroundColor: Colors.white,
            context: context,
            builder: (BuildContext builder) {
              return  widget;
            },
          );
}

