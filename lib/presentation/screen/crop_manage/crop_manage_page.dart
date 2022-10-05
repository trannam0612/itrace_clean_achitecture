import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/list_season/list_season_page.dart';
import 'package:itrace_247/presentation/screen/notification/notification_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';
import 'package:itrace_247/presentation/screen/warehouse_management/warehouse_management_page.dart';

class CropManagePage extends StatefulWidget {
  const CropManagePage({super.key});
  static const String routeName = '/CropManagePage';

  @override
  State<CropManagePage> createState() => CropManagePageState();
}

class CropManagePageState extends State<CropManagePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BasePage(
        appBar: appBarShared(
          context: context,
          'Trồng trọt',
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
              Text(
                'Khu vực trồng trọt nơi bạn có thể quản lý các việc làm liên quan đến trồng hoa màu',
                textAlign: TextAlign.center,
                style: StylesConstant.ts18w500
                    .copyWith(color: ColorsConstant.c04142C),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Chọn mục để đi vào bên trong',
                textAlign: TextAlign.center,
                style: StylesConstant.ts16w400
                    .copyWith(color: ColorsConstant.c0A89FE),
              ),
              SizedBox(
                height: 22.h,
              ),
              _itemCropManageWidget(
                title: 'Quản lý mùa vụ',
                icon: SvgAssets.icField,
                onPress: () {
                  Navigator.pushNamed(context, ListSeasonPage.routeName);
                },
              ),
              _itemCropManageWidget(
                title: S.of(context).warehouse_management,
                icon: SvgAssets.icBoxes,
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    WarehouseManagementPage.routeName,
                  );
                },
              ),
              _itemCropManageWidget(
                title: 'Hỏi đáp chuyên gia',
                icon: SvgAssets.icCustomerService,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemCropManageWidget({
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
            children: <Widget>[
              SvgPicture.asset(icon),
              SizedBox(
                width: 16.w,
              ),
              Text(
                title,
                style: StylesConstant.ts16w600,
              ),
              const Spacer(),
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
