import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/button_custom.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class InformationCropsWidget extends StatelessWidget {
  const InformationCropsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return SingleChildScrollView(
            physics: orientation == Orientation.portrait
                ? const NeverScrollableScrollPhysics()
                : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(SvgAssets.icCancel),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  "Súp lơ xanh",
                  style: StylesConstant.ts18w500,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Tiêu chuẩn Vietgap",
                  style: StylesConstant.ts16w600
                      .copyWith(color: ColorsConstant.c0A89FE),
                ),
                SizedBox(
                  height: 16.h,
                ),
                customCachedNetworkImage(
                  url:
                      'https://check.net.vn/Data/product/mainimages/original/product3253.jpg',
                  width: 100.w,
                  height: 100.w,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Loại giống',
                      style: StylesConstant.ts16w600
                          .copyWith(color: ColorsConstant.c04142C),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      'CAI 88 88 88, Việt Nam',
                      style: StylesConstant.ts16w600
                          .copyWith(color: ColorsConstant.c04142C),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Đang canh tác",
                  style: StylesConstant.ts16w600
                      .copyWith(color: ColorsConstant.c0A89FE),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(SvgAssets.icLocation),
                    SizedBox(
                      width: 8.w,
                    ),
                    Flexible(
                      child: Text(
                        'Thôn 14, Xã Văn Đàn,Huyện Tiến Linh, Tỉnh Hưng Yên',
                        style: StylesConstant.ts16w600
                            .copyWith(color: ColorsConstant.c04142C),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                _itemTitleWidget(
                  icon: SvgAssets.icFactory,
                  title: 'Diện tích',
                  value: '15',
                  unit: 'hecta',
                ),
                SizedBox(
                  height: 16.h,
                ),
                _itemTitleWidget(
                  icon: SvgAssets.icSack,
                  title: 'Sản lượng dự kiến',
                  value: '150',
                  unit: 'tấn',
                ),
                SizedBox(
                  height: 16.h,
                ),
                _itemTitleWidget(
                  icon: SvgAssets.icCalendar,
                  title: 'Ngày bắt đầu',
                  unit: '01/03/2022',
                ),
                SizedBox(
                  height: 16.h,
                ),
                _itemTitleWidget(
                  icon: SvgAssets.icCalendar,
                  title: 'Ngày thu hoạch',
                  unit: '01/03/2022',
                ),
                SizedBox(
                  height: 16.h,
                ),
                _itemTitleWidget(
                  icon: SvgAssets.icPrecision,
                  title: 'Mã vùng trồng',
                  unit: 'HUNGYEN123',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _itemTitleWidget({
    required String icon,
    required String title,
    String? value,
    required String unit,
  }) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(icon),
        SizedBox(
          width: 8.w,
        ),
        Text(
          title,
          style:
              StylesConstant.ts16w400.copyWith(color: ColorsConstant.c04142C),
        ),
        const Spacer(),
        Text(
          '${value ?? ''} $unit',
          style:
              StylesConstant.ts18w500.copyWith(color: ColorsConstant.c04142C),
        ),
      ],
    );
  }
}
