import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

AppBar appBarShared(
  String? title, {
  BuildContext? context,
  Color? colors = ColorsConstant.c006DB7,
  Color? colorsTitle = ColorsConstant.cWhite,
  bool? centerTitle = true,
  bool? isShowBackButton = true,
  Widget? leading,
  double? fontSize = 18,
  ShapeBorder? shape,
  SystemUiOverlayStyle? systemOverlayStyle,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    shape: shape,
    systemOverlayStyle: systemOverlayStyle ??
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
    title: Text(
      title ?? '',
      style: StylesConstant.ts20w600.copyWith(
        color: colorsTitle,
        fontSize: fontSize,
      ),
    ),
    leading: isShowBackButton == true
        ? leading ??
            IconButton(
              onPressed: () {
                Navigator.pop(context!);
              },
              icon: SvgPicture.asset(SvgAssets.icBack),
            )
        : const SizedBox.shrink(),
    actions: actions ?? <Widget>[const SizedBox.shrink()],
    backgroundColor: colors,
    centerTitle: centerTitle,
    elevation: 0.0,
  );
}
