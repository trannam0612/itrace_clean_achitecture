import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/list_cultivars_management/list_cultivars_management_page.dart';
import 'package:itrace_247/presentation/screen/list_equipment_material_management/list_equipment_material_management_page.dart';
import 'package:itrace_247/presentation/screen/list_harvest/list_harvest_page.dart';
import 'package:itrace_247/presentation/screen/notification/notification_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class WarehouseManagementPage extends StatefulWidget {
  const WarehouseManagementPage({super.key});
  static const String routeName = '/WarehouseManagementPage';

  @override
  State<WarehouseManagementPage> createState() =>
      WarehouseManagementPageState();
}

class WarehouseManagementPageState extends State<WarehouseManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BasePage(
        appBar: appBarShared(
          context: context,
          S.of(context).warehouse_management,
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
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
                decoration: BoxDecoration(
                  color: ColorsConstant.cD3EAFF,
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      PngAssets.imgWarehouse,
                      width: 64.w,
                      height: 64.w,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      S.of(context).title_warehouse_management_page,
                      textAlign: TextAlign.center,
                      style: StylesConstant.ts18w500
                          .copyWith(color: ColorsConstant.c04142C),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 36.h,
              ),
              _itemWarehouseManagementWidget(
                title: S.of(context).materials_equipment_tools,
                icon: SvgAssets.icGardeningTools,
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    ListEquipmentMaterialManagementPage.routeName,
                  );
                },
              ),
              _itemWarehouseManagementWidget(
                title: S.of(context).list_of_cultivars,
                icon: SvgAssets.icHarvest2,
                onPress: () {
                  Navigator.pushNamed(context, ListCultivarsPage.routeName);
                },
              ),
              _itemWarehouseManagementWidget(
                title: S.of(context).post_harvest_products,
                icon: SvgAssets.icVegetable,
                onPress: () {
                  Navigator.pushNamed(context, ListHarvestPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemWarehouseManagementWidget({
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
              Expanded(
                child: Text(
                  title,
                  style: StylesConstant.ts16w600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
