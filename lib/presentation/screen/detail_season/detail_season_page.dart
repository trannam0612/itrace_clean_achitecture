import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/config/utils/assets.dart';

import 'package:itrace_247/config/utils/colors.dart';
import 'dart:developer';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/planting_area_detail/planting_area_detail_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_slider.dart';
import 'package:itrace_247/presentation/screen/utils_widget/drawer_filter_custom.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';
import 'package:itrace_247/config/utils/styles.dart';

class DetailSeasonPage extends StatefulWidget {
  const DetailSeasonPage({
    super.key,
  });
  static const String routeName = '/DetailSeasonPage';

  @override
  State<DetailSeasonPage> createState() => _DetailSeasonPageState();
}

class _DetailSeasonPageState extends State<DetailSeasonPage> {
  ValueNotifier<bool> isValueTab = ValueNotifier<bool>(false);
  ValueNotifier<bool> isSelecting = ValueNotifier<bool>(false);
  ValueNotifier<bool> isTypeSelect = ValueNotifier<bool>(false);
  ValueNotifier<bool> isStatus = ValueNotifier<bool>(false);
  ValueNotifier<List<int>> listSelected = ValueNotifier<List<int>>(<int>[]);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int a = 2;
  void handleClick(int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    log('a:$a');
    return BasePage(
      keyScaffold: _scaffoldKey,
      appBar: appBarShared(
        context: context,
        S.of(context).detail_season,
      ),
      endDrawer: const DrawerFilterCustomWidget(),
      body: AnimatedBuilder(
        animation: Listenable.merge(
          <ValueNotifier<dynamic>>[isValueTab, listSelected],
        ),
        builder: (BuildContext context, _) => Column(
          children: <Widget>[
            _itemSeasonWidget(),
            Padding(
              padding: EdgeInsets.all(
                24.w,
              ),
              child: Column(
                children: <Widget>[
                  _searchAndFilterWidget(),
                  SizedBox(
                    height: 24.h,
                  ),
                  _listPartnerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _itemSeasonWidget() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: ColorsConstant.cD3EAFF,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.w),
          bottomRight: Radius.circular(20.w),
        ),
      ),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Đang hoạt động',
              style: StylesConstant.ts14w600
                  .copyWith(color: ColorsConstant.c007DF0),
            ),
          ),
          SizedBox(
            height: 9.h,
          ),
          Row(
            children: <Widget>[
              Image.asset(
                PngAssets.imgCrops,
                width: 48.w,
                height: 48.w,
              ),
              SizedBox(
                width: 16.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Mùa vụ hè thu 2022',
                    style: StylesConstant.ts18w500
                        .copyWith(color: ColorsConstant.c04142C),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '10 Vùng trồng',
                    style: StylesConstant.ts14w600
                        .copyWith(color: ColorsConstant.c0A89FE),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '01/05/2022 Thu hoạch ',
              style: StylesConstant.ts14w600
                  .copyWith(color: ColorsConstant.c04142C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listPartnerWidget() {
    double currentSliderValue = 20;

    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () => Navigator.pushNamed(context, PlantingAreaPage.routeName),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsConstant.cWhite,
            borderRadius: BorderRadius.circular(8.w),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.12),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Đang canh tác',
                  style: StylesConstant.ts14w600
                      .copyWith(color: ColorsConstant.c007DF0),
                ),
              ),
              SizedBox(
                height: 9.h,
              ),
              Row(
                children: <Widget>[
                  Image.asset(
                    PngAssets.imgFarm,
                    width: 48.w,
                    height: 48.w,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mã Vùng Trồng 102 HUNGYEN',
                          style: StylesConstant.ts16w600
                              .copyWith(color: ColorsConstant.c04142C),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '6 loại cây trồng',
                          style: StylesConstant.ts14w600
                              .copyWith(color: ColorsConstant.c0A89FE),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              customSliderWidget(context, value: 20),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '01/04/2022 Thu hoạch',
                  style: StylesConstant.ts14w600
                      .copyWith(color: ColorsConstant.c9E9E9E),
                ),
              ),
            ],
          ),
        ),
      ),
      separatorBuilder: (BuildContext context, int index) => SizedBox(
        height: 16.h,
      ),
      itemCount: 10,
    );
  }

  Row _searchAndFilterWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: TextfieldCustom(
            controller: TextEditingController(),
            hintText: 'Tìm vùng trồng',
            isCircular: true,
            prefixIcon: SvgPicture.asset(
              SvgAssets.icSearch,
              fit: BoxFit.scaleDown,
            ),
            colorHint: ColorsConstant.cBlack,
          ),
        ),
        SizedBox(
          width: 21.w,
        ),
        Text(
          'Phân loại',
          style: StylesConstant.ts14w600,
        ),
        IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openEndDrawer();
          },
          icon: SvgPicture.asset(SvgAssets.icFillter),
        )
      ],
    );
  }
}
