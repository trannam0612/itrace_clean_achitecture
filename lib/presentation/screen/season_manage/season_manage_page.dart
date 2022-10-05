import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/list_crops/list_crops_page.dart';
import 'package:itrace_247/presentation/screen/list_season/list_season_page.dart';
import 'package:itrace_247/presentation/screen/notification/notification_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class SeasonManagePage extends StatefulWidget {
  const SeasonManagePage({super.key});
  static const String routeName = '/SeasonManagePage';

  @override
  State<SeasonManagePage> createState() => SeasonManagePageState();
}

class SeasonManagePageState extends State<SeasonManagePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: appBarShared(
        context: context,
        'Quản lý mùa vụ',
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NotificationPage.routeName);
            },
            icon: SvgPicture.asset(SvgAssets.icNotification),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
              decoration: BoxDecoration(
                color: ColorsConstant.cD3E9A6,
                borderRadius: BorderRadius.circular(16.w),
              ),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    PngAssets.imgAgriculture,
                    width: 74.w,
                    height: 74.w,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    'Hãy tạo các mùa vụ để thu hoạch được nhiều nông sản chất lượng tốt nhất',
                    textAlign: TextAlign.center,
                    style: StylesConstant.ts16w400
                        .copyWith(color: ColorsConstant.c04142C),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            _itemSeasonManageWidget(
              title: 'Thông tin mùa vụ',
              icon: SvgAssets.icDiagram,
              onPress: () {
                Navigator.pushNamed(context, ListSeasonPage.routeName);
              },
            ),
            _itemSeasonManageWidget(
              title: S.of(context).list_of_plants_crops,
              icon: SvgAssets.icHarvest,
              onPress: () =>
                  Navigator.pushNamed(context, ListCropsPage.routeName),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemSeasonManageWidget({
    required String title,
    required String icon,
    Function()? onPress,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: ColorsConstant.cWhite,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(24.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SvgPicture.asset(icon),
              SizedBox(
                width: 16.w,
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Text(
                  title,
                  style: StylesConstant.ts16w600,
                ),
              ),
              SvgPicture.asset(
                SvgAssets.icArrowRight,
                color: ColorsConstant.c00C753,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
