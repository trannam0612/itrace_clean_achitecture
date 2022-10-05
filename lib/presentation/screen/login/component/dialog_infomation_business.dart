import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';
import 'package:itrace_247/presentation/screen/utils_widget/button_custom.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';

class DialogInfomationBusiness extends StatelessWidget {
  const DialogInfomationBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(16.w),
      insetPadding: EdgeInsets.all(16.w),
      backgroundColor: ColorsConstant.cWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.w)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              'Vui lòng liên hệ thông tin bên dưới để được hỗ trợ',
              style: StylesConstant.ts20w600.copyWith(
                color: ColorsConstant.c0A89FE,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          TextfieldCustom(
            title: 'Số điện thoại liên hệ',
            controller: TextEditingController(),
            hintText: '0937 290 264',
            readOnly: true,
            colorHint: ColorsConstant.c04142C,
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Địa chỉ email',
            controller: TextEditingController(),
            hintText: 'itrace247@gmail.com',
            readOnly: true,
            colorHint: ColorsConstant.c04142C,
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Địa chỉ liên hệ',
            controller: TextEditingController(),
            hintText: '39 Đường Láng, Quận Tây Hồ, Hà Nội',
            readOnly: true,
            colorHint: ColorsConstant.c04142C,
            isMaxLine: 5,
          ),
          SizedBox(
            height: 24.h,
          ),
          ButtonCustom(
            params: CustomButtonParams.primary(
              text: 'Đóng',
              backgroundColor: ColorsConstant.c0A89FE,
              width: double.infinity,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
