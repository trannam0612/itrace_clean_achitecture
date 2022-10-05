import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:itrace_247/presentation/screen/utils_widget/button_custom.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

Future<dynamic> showCommonErrorDialog({
  required BuildContext context,
  bool dismissible = true,
  Color backgroundColor = Colors.white,
  Function()? onPressed,
}) {
  return showCustomDialog(
    context: context,
    options: CustomDialogParams.simpleAlert(
      message: 'error_common_msg',
      negativeTitle: 'confirm',
      onPressed: onPressed,
    ),
    dismissible: dismissible,
    backgroundColor: backgroundColor,
  );
}

Future<dynamic> showCustomDialog({
  required BuildContext context,
  required CustomDialogParams options,
  bool dismissible = true,
  Color backgroundColor = Colors.white,
}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(16.w),
        insetPadding: EdgeInsets.all(16.w),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content:
            CustomDialog(params: options, backgroundColor: backgroundColor),
      );
    },
  );
}

Future<dynamic> showCustomDialogLoading({
  required BuildContext context,
  bool dismissible = true,
}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (BuildContext context) {
      return const Center(child: CupertinoActivityIndicator());
    },
  );
}

class CustomDialogParams {
  CustomDialogParams({
    this.positiveParams,
    this.negativeParams,
    this.title,
    this.image,
    this.message,
  });

  /// A simple dialog will only has 1 negative button,
  /// when button is clicked, the dialog simply dismissed
  ///
  /// @param title: title of the dialog
  ///
  /// @param message: message of the dialog
  ///
  /// @param negativeTitle: title of negative option
  factory CustomDialogParams.simpleAlert({
    String? title,
    Widget? image,
    String? message,
    String? negativeTitle,
    Function()? onPressed,
    bool? dismissOnPressed,
  }) {
    return CustomDialogParams(
      title: title,
      image: image,
      message: message,
      negativeParams: CustomDialogButtonParams(
        dismissOnPressed: dismissOnPressed ?? true,
        title: negativeTitle ?? ' ',
        onPressed: onPressed,
      ),
    );
  }
  factory CustomDialogParams.customAlert({
    String? title,
    Widget? image,
    String? message,
    String? negativeTitle,
    String? positiveTitle,
    Function()? onPressedNegative,
    Function()? onPressedPositive,
    Color? colorNegative,
    Color? colorPositive,
    Color? colorTitlePositive,
    Color? colorTitleNegative,
    bool? dismissOnPressed,
  }) {
    return CustomDialogParams(
      title: title,
      image: image,
      message: message,
      negativeParams: CustomDialogButtonParams(
        dismissOnPressed: dismissOnPressed ?? true,
        title: negativeTitle ?? ' ',
        onPressed: onPressedNegative,
        colorTitleButton: colorTitleNegative ?? ColorsConstant.cWhite,
        colorButton: colorNegative ?? ColorsConstant.c0A89FE,
      ),
      positiveParams: CustomDialogButtonParams(
        dismissOnPressed: dismissOnPressed ?? true,
        title: positiveTitle ?? ' ',
        onPressed: onPressedPositive,
        colorTitleButton: colorTitlePositive ?? ColorsConstant.cWhite,
        colorButton: colorPositive ?? ColorsConstant.c0A89FE,
      ),
    );
  }

  final String? title;
  final String? message;
  final Widget? image;
  final CustomDialogButtonParams? positiveParams;
  final CustomDialogButtonParams? negativeParams;
}

class CustomDialogButtonParams {
  CustomDialogButtonParams({
    required this.title,
    this.colorButton = ColorsConstant.c0A89FE,
    this.colorTitleButton = ColorsConstant.cWhite,
    this.onPressed,
    this.dismissOnPressed = true,
  });

  final String title;
  final Color colorButton;
  final Color colorTitleButton;
  final VoidCallback? onPressed;
  final bool dismissOnPressed;
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.params,
    required this.backgroundColor,
  }) : super(key: key);

  final CustomDialogParams params;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // Since AlertDialog already has some padding
      padding: EdgeInsets.all(16.w),
      color: backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _title(),
          _image(),
          _subtitle(),
          const SizedBox(height: 24),
          _buttonsRow(context),
        ],
      ),
    );
  }

  Widget _title() {
    if (params.title == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        params.title!,
        textAlign: TextAlign.center,
        style: StylesConstant.ts20w500.copyWith(color: ColorsConstant.c0A89FE),
      ),
    );
  }

  Widget _subtitle() {
    if (params.message == null) return const SizedBox.shrink();
    return Text(
      params.message!,
      textAlign: TextAlign.center,
      style: StylesConstant.ts16w400,
    );
  }

  Widget _buttonsRow(BuildContext context) {
    final bool hasBothButton =
        params.negativeParams != null && params.positiveParams != null;
    return Row(
      children: <Widget>[
        _button(context, params.negativeParams),
        if (hasBothButton) const SizedBox(width: 16),
        _button(context, params.positiveParams),
      ],
    );
  }

  Widget _button(BuildContext context, CustomDialogButtonParams? options) {
    if (options == null) return const SizedBox.shrink();
    final CustomButtonParams params = CustomButtonParams.primary(
      text: options.title,
      backgroundColor: options.colorButton,
      textStyle:
          StylesConstant.ts16w500.copyWith(color: options.colorTitleButton),
      onPressed: () => _onButtonPressed(context, options),
    );
    return Expanded(child: ButtonCustom(params: params));
  }

  void _onButtonPressed(
    BuildContext context,
    CustomDialogButtonParams options,
  ) {
    if (options.dismissOnPressed) {
      Navigator.of(context).pop();
    }

    options.onPressed?.call();
  }

  Widget _image() {
    if (params.image == null) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.only(top: 21.h, bottom: 16.h),
      child: params.image,
    );
  }
}
