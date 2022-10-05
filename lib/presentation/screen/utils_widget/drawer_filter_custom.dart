import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/button_custom.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class DrawerFilterCustomWidget extends StatelessWidget {
  const DrawerFilterCustomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = kToolbarHeight;
    return Container(
      padding: EdgeInsets.only(
        top: statusBarHeight + appBarHeight + 1,
      ),
      width: MediaQuery.of(context).size.width / 2,
      child: Drawer(
        elevation: 0.0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  SvgPicture.asset(SvgAssets.icFillter),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    'Phân loại',
                    style: StylesConstant.ts14w600
                        .copyWith(color: ColorsConstant.c04142C),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              // Text(
              //   'Trạng thái',
              //   style: StylesConstant.ts16w600
              //       .copyWith(color: ColorsConstant.c04142C),
              // ),
              // ListView.separated(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   itemBuilder: (BuildContext context, int index) => Row(
              //     children: <Widget>[
              //       SvgPicture.asset(SvgAssets.icChoseUnselect),
              //       SizedBox(
              //         width: 24.w,
              //       ),
              //       Text(
              //         'Mới tạo',
              //         style: StylesConstant.ts14w500.copyWith(
              //           color: ColorsConstant.c666666,
              //         ),
              //       )
              //     ],
              //   ),
              //   separatorBuilder: (BuildContext context, int index) => SizedBox(
              //     height: 16.h,
              //   ),
              //   itemCount: 3,
              // ),
              // SizedBox(
              //   height: 24.h,
              // ),
              Text(
                'Thời gian',
                style: StylesConstant.ts16w600
                    .copyWith(color: ColorsConstant.c04142C),
              ),
              SizedBox(
                height: 24.h,
              ),
              Row(
                children: <Widget>[
                  SvgPicture.asset(SvgAssets.icChoseUnselect),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    'Mới nhất',
                    style: StylesConstant.ts14w500.copyWith(
                      color: ColorsConstant.c666666,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: <Widget>[
                  SvgPicture.asset(SvgAssets.icChoseUnselect),
                  SizedBox(
                    width: 24.w,
                  ),
                  Text(
                    'Cũ nhất',
                    style: StylesConstant.ts14w500.copyWith(
                      color: ColorsConstant.c666666,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              ButtonCustom(
                params: CustomButtonParams.primary(
                  text: 'Áp dụng',
                  backgroundColor: ColorsConstant.c0A89FE,
                  width: double.infinity,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
