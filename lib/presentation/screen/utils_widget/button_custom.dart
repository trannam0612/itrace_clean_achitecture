import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:itrace_247/config/utils/styles.dart';

class CustomButtonParams {
  CustomButtonParams({
    this.height,
    this.width,
    required this.text,
    this.onPressed,
    this.margin,
    this.padding,
    this.boxShadow,
    this.radius = 24,
    this.textStyle,
    this.backgroundColor,
    this.wrapWidth = false,
    this.icon,
    this.isCircular = false,
  });

  factory CustomButtonParams.primary({
    required String text,
    VoidCallback? onPressed,
    bool hasGradient = true,
    bool wrapWidth = false,
    Color? backgroundColor,
    EdgeInsets? padding,
    TextStyle? textStyle,
    Widget? icon,
    bool? isCircular = false,
    double? width,
    double? height,
  }) {
    return CustomButtonParams(
      text: text,
      padding: padding,
      textStyle: textStyle ?? StylesConstant.tsButton16w500,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      wrapWidth: wrapWidth,
      icon: icon,
      isCircular: isCircular,
      width: width,
      height: height,
    );
  }

  final double? height;
  final double? width;
  final String text;
  final VoidCallback? onPressed;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final List<BoxShadow>? boxShadow;
  final double radius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final bool wrapWidth;
  final Widget? icon;
  final bool? isCircular;

  CustomButtonParams copyWith({
    double? height,
    double? width,
    String? text,
    VoidCallback? onPressed,
    EdgeInsets? margin,
    EdgeInsets? padding,
    List<BoxShadow>? boxShadow,
    double? radius,
    TextStyle? textStyle,
    Gradient? gradient,
    Color? backgroundColor,
    bool? wrapWidth,
    Widget? icon,
    bool? isCircular,
  }) =>
      CustomButtonParams(
        height: height ?? this.height,
        width: width ?? this.width,
        text: text ?? this.text,
        onPressed: onPressed ?? this.onPressed,
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        boxShadow: boxShadow ?? this.boxShadow,
        radius: radius ?? this.radius,
        textStyle: textStyle ?? this.textStyle,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        wrapWidth: wrapWidth ?? this.wrapWidth,
        icon: icon ?? this.icon,
        isCircular: isCircular ?? this.isCircular,
      );
}

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({super.key, required this.params});

  final CustomButtonParams params;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => params.onPressed?.call(),
      child: Container(
        width: params.width,
        height: params.height,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: params.backgroundColor,
          borderRadius: BorderRadius.circular(
            params.isCircular! ? 50 : 8,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: params.icon ?? const SizedBox.shrink(),
            ),
            Flexible(
              child: Text(
                params.text,
                style: params.textStyle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
