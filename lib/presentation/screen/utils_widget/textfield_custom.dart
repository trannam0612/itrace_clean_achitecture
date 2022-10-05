import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class TextfieldCustom extends StatefulWidget {
  const TextfieldCustom({
    Key? key,
    required this.controller,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.onChange,
    this.onSaved,
    this.isMaxLine = 1,
    this.isCircular = false,
    this.isObligatory = false,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.keyText,
    this.inputFormatters,
    this.colorTitle = ColorsConstant.cBlack,
    this.colorHint = ColorsConstant.c9E9E9E,
    this.title,
    this.onButtonFormChange,
    this.readOnly = false,
    this.onTap,
    this.onTapIsClear,
    this.onFieldSubmitted,
    this.maxLength,
  }) : super(key: key);
  final Key? keyText;
  final int isMaxLine;
  final bool isCircular;
  final bool isObligatory;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onChange;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onButtonFormChange;
  final Color colorTitle;
  final Color colorHint;
  final String? title;
  final String? maxLength;
  final bool readOnly;
  final Function()? onTap;
  final Function()? onTapIsClear;
  final void Function(String)? onFieldSubmitted;

  @override
  State<TextfieldCustom> createState() => _TextfieldCustomState();
}

class _TextfieldCustomState extends State<TextfieldCustom> {
  int length = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              widget.title != null
                  ? Text.rich(
                      TextSpan(
                        text: widget.title ?? '',
                        children: <TextSpan>[
                          TextSpan(
                            text: widget.isObligatory ? ' *' : '',
                            style: StylesConstant.ts16w400
                                .copyWith(color: ColorsConstant.cFF0A0A),
                          ),
                        ],
                      ),
                      style: StylesConstant.ts16w400
                          .copyWith(color: ColorsConstant.c04142C),
                    )
                  : const SizedBox.shrink(),
              if (widget.maxLength != null)
                Text(
                  '${length.toString()}/${widget.maxLength}',
                  style: StylesConstant.ts16w400
                      .copyWith(color: ColorsConstant.c04142C),
                )
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          TextFormField(
            maxLines: widget.isMaxLine,
            onFieldSubmitted: widget.onFieldSubmitted,
            readOnly: widget.readOnly,
            onTap: widget.onTap,
            textAlignVertical: TextAlignVertical.center,
            inputFormatters: widget.inputFormatters,
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            keyboardType: widget.keyboardType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            validator: widget.validator,
            style:
                StylesConstant.ts16w400.copyWith(color: ColorsConstant.c04142C),
            onChanged: (String value) {
              setState(() {
                length = value.length;
              });
              widget.onChange;
            },
            // obscureText: widget.isPasswordField && !_isShowPassword,
            decoration: InputDecoration(
              filled: true, //<-- SEE HERE
              fillColor: ColorsConstant.cF9F9F9,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon
              // ??
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         // widget.isPasswordField
              //         //     ? IconButton(
              //         //         splashColor: ColorsConstant.c002C54,
              //         //         onPressed: () {
              //         //           setState(() {
              //         //             _isShowPassword = !_isShowPassword;
              //         //           });
              //         //         },
              //         //         icon: _isShowPassword
              //         //             ? SvgPicture.asset(
              //         //                 Res.ic_eye_slash,
              //         //                 color: AppColors.blackColor
              //         //                     .withOpacity(0.24),
              //         //               )
              //         //             : SvgPicture.asset(
              //         //                 Res.ic_eye,
              //         //                 color: AppColors.blackColor
              //         //                     .withOpacity(0.24),
              //         //               ),
              //         //       )
              //         //     : const SizedBox.shrink(),
              //         // widget.isClear
              //         //     ? IconButton(
              //         //         splashColor: AppColors.transparentColor,
              //         //         onPressed: () {
              //         //           widget.controller?.clear();
              //         //           widget.onTapIsClear?.call();
              //         //         },
              //         //         icon: SvgPicture.asset(
              //         //           Res.ic_close_circle,
              //         //           color: AppColors.blackColor.withOpacity(0.24),
              //         //         ))
              //         //     : const SizedBox.shrink(),
              //       ],
              //     ),
              ,
              hintText: widget.hintText,
              hintStyle:
                  StylesConstant.ts16w600.copyWith(color: widget.colorHint),
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.isCircular ? 20.w : 8.w),
                borderSide: BorderSide.none,
              ),
              errorStyle: StylesConstant.ts14w500
                  .copyWith(color: ColorsConstant.cFF0A0A),
              errorBorder: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(widget.isCircular ? 20.w : 8.w),
                borderSide:
                    const BorderSide(color: ColorsConstant.cFF0A0A, width: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
