import 'dart:developer';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/shared_preferences/shared_preferences_sevice.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/crop_manage/crop_manage_page.dart';
import 'package:itrace_247/presentation/screen/notification/notification_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String routeName = '/HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocalStorageService localStorageService = getIt();

  @override
  void initState() {
    // TODO: implement initState
    localStorageService.saveToDisk('test', 'content');

    final test = localStorageService.getFromDisk('test');
    log('test:${test}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      isScroll: false,
      appBar: appBarShared(
        context: context,
        'Trang chủ',
        isShowBackButton: false,
        actions: <Widget>[
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, NotificationPage.routeName),
            icon: SvgPicture.asset(SvgAssets.icNotification),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'iTrace 247 Xin chào !',
                style: StylesConstant.ts20w600
                    .copyWith(color: ColorsConstant.c0097D6),
              ),
              SizedBox(
                height: 16.h,
              ),
              Text(
                'Chúc bạn một ngày làm việc vui vẻ',
                style: StylesConstant.ts20w400,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Bấm vào các mục bên dưới nhé',
                style: StylesConstant.ts16w400
                    .copyWith(color: ColorsConstant.c0097D6),
              ),
              SizedBox(
                height: 24.h,
              ),
              GestureDetector(
                onTap: () {
                  log('message:${ModalRoute.of(context)!.settings.name}');
                  Navigator.pushNamed(context, CropManagePage.routeName);
                },
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Image.asset(
                      PngAssets.imgCrop,
                      width: 366.w,
                      height: 320.h,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: <Widget>[
                        SvgPicture.asset(SvgAssets.icCrop),
                        Text(
                          'Trồng trọt',
                          style: StylesConstant.ts16w500
                              .copyWith(color: ColorsConstant.cWhite),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16.w),
                    child: Image.asset(
                      PngAssets.imgContactSupport,
                      width: 366.w,
                      height: 190.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      SvgPicture.asset(SvgAssets.icContactSupport),
                      Text(
                        'Hỗ trợ hỏi đáp',
                        style: StylesConstant.ts16w500
                            .copyWith(color: ColorsConstant.cWhite),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
