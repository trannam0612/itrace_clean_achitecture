import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/services.dart';

class InPutPinWidget extends StatefulWidget {
  const InPutPinWidget({
    super.key,
    this.validator,
    required this.txtPin,
    required this.errorInput,
    this.onChanged,
  });

  @override
  State<InPutPinWidget> createState() => _InPutPinWidgetState();
  final String? Function(String?)? validator;
  final TextEditingController txtPin;
  final bool errorInput;
  final Function(String)? onChanged;
}

class _InPutPinWidgetState extends State<InPutPinWidget> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
      ),
      decoration: BoxDecoration(
        color: ColorsConstant.cWhite,
        border: Border.all(
          color:
              widget.errorInput ? ColorsConstant.cFF0A0A : Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(8.w),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: PinCodeTextField(
        autoDisposeControllers: false,
        controller: widget.txtPin,
        inputFormatters: <TextInputFormatter>[
          // WhitelistingTextInputFormatter(RegExp('[0-9]')),
          FilteringTextInputFormatter.allow(RegExp('[0-9]')),
        ],
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        animationDuration: const Duration(milliseconds: 300),
        cursorHeight: 50,
        cursorWidth: 40,
        backgroundColor: ColorsConstant.cWhite,
        textStyle: StylesConstant.ts32w600.copyWith(
          color: widget.errorInput
              ? ColorsConstant.cFF0A0A
              : ColorsConstant.c0A89FE,
        ),
        onChanged: (value) {
          widget.onChanged?.call(value);
        },
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          inactiveColor: widget.errorInput
              ? ColorsConstant.cFF0A0A
              : ColorsConstant.c9E9E9E,
          inactiveFillColor: widget.errorInput
              ? ColorsConstant.cFF0A0A
              : ColorsConstant.c0A89FE,
          selectedColor: widget.errorInput
              ? ColorsConstant.cFF0A0A
              : ColorsConstant.c0A89FE,
          activeColor: widget.errorInput
              ? ColorsConstant.cFF0A0A
              : ColorsConstant.c0A89FE,
        ),
        appContext: context,
      ),
    );
  }
}
