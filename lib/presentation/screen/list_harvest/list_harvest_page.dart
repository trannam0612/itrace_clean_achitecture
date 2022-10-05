import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:itrace_247/presentation/screen/crops_detail/crops_detail.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_slider.dart';
import 'package:itrace_247/presentation/screen/utils_widget/drawer_filter_custom.dart';
import 'package:itrace_247/config/utils/assets.dart';

import 'package:itrace_247/config/utils/colors.dart';
import 'dart:developer';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';
import 'package:itrace_247/config/utils/styles.dart';

class ListHarvestPage extends StatefulWidget {
  const ListHarvestPage({
    super.key,
  });
  static const String routeName = '/ListHarvestPage';

  @override
  State<ListHarvestPage> createState() => _ListHarvestPageState();
}

class _ListHarvestPageState extends State<ListHarvestPage> {
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
        S.of(context).harvest_list,
      ),
      endDrawer: const DrawerFilterCustomWidget(),
      body: AnimatedBuilder(
        animation: Listenable.merge(
          <ValueNotifier<dynamic>>[isValueTab, listSelected],
        ),
        builder: (BuildContext context, _) => Padding(
          padding: EdgeInsets.all(
            24.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _itemSeasonWidget(),
              SizedBox(
                height: 24.h,
              ),
              _searchAndFilterWidget(),
              SizedBox(
                height: 24.h,
              ),
              _listPartnerWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemSeasonWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Chọn vùng trồng',
          style:
              StylesConstant.ts16w400.copyWith(color: ColorsConstant.c04142C),
        ),
        SizedBox(
          height: 8.h,
        ),
        TextfieldCustom(
          controller: TextEditingController(),
          readOnly: true,
          hintText: 'Vùng trồng KAA 103',
          suffixIcon: SvgPicture.asset(
            SvgAssets.icArrowDown,
            fit: BoxFit.scaleDown,
          ),
          colorHint: ColorsConstant.cBlack,
        ),
      ],
    );
  }

  Widget _listPartnerWidget() {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () => showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
          ),
          isScrollControlled: true,
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext builder) {
            return const DetailCropsWidget();
          },
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsConstant.cWhite,
            borderRadius: BorderRadius.circular(16.w),
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
                  'Thu hoạch xong',
                  style: StylesConstant.ts14w600
                      .copyWith(color: ColorsConstant.c007DF0),
                ),
              ),
              Row(
                children: <Widget>[
                  customCachedNetworkImage(
                    url:
                        'https://check.net.vn/Data/product/mainimages/original/product3253.jpg',
                    width: 48.w,
                    height: 48.w,
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Text(
                    'Súp lơ trắng',
                    style: StylesConstant.ts16w600
                        .copyWith(color: ColorsConstant.c04142C),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              customSliderWidget(context, value: 100),
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
            hintText: 'Tìm theo tên',
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
