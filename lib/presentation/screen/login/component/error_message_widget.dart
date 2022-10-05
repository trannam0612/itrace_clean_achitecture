import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class ErrorMessgaeWidget extends StatelessWidget {
  const ErrorMessgaeWidget({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 24.h,
        ),
        Text(
          errorMessage,
          style: StylesConstant.ts16w600.copyWith(
            color: ColorsConstant.cFF0A0A,
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
      ],
    );
  }
}
