import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/list_crops/information_crops_bottom_sheet.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/presentation/screen/utils_widget/drawer_filter_custom.dart';
import 'package:itrace_247/config/utils/assets.dart';

import 'package:itrace_247/config/utils/colors.dart';
import 'dart:developer';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';
import 'package:itrace_247/config/utils/styles.dart';

class ListCropsPage extends StatefulWidget {
  const ListCropsPage({
    super.key,
  });
  static const String routeName = '/ListCropsPage';

  @override
  State<ListCropsPage> createState() => _ListCropsPageState();
}

class _ListCropsPageState extends State<ListCropsPage> {
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
    return BasePage(
      keyScaffold: _scaffoldKey,
      appBar: appBarShared(
        context: context,
        S.of(context).list_of_plants_crops,
      ),
      endDrawer: const DrawerFilterCustomWidget(),
      body: AnimatedBuilder(
        animation: Listenable.merge(
          <ValueNotifier<dynamic>>[isValueTab, listSelected],
        ),
        builder: (BuildContext context, _) => Column(
          children: <Widget>[
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

  Widget _listPartnerWidget() {
    double crossAxisSpacing = 14.h, mainAxisSpacing = 16.w;
    int crossAxisCount = 2;

    Size size = MediaQuery.of(context).size;
    double ratio = (size.shortestSide / 2) / ((size.longestSide - 16) / 3);

    return GridView.builder(
      shrinkWrap: true,
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: ratio,
      ),
      itemBuilder: (BuildContext context, int index) {
        return _itemPartnerWidget(index);
      },
    );
  }

  GestureDetector _itemPartnerWidget(int index) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.w),
          ),
          isScrollControlled: true,
          backgroundColor: Colors.white,
          context: context,
          builder: (BuildContext builder) {
            return const InformationCropsWidget();
          },
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(
                0,
                1,
              ), // changes position of shadow
            ),
          ],
          color: ColorsConstant.cWhite,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            customCachedNetworkImage(
              url:
                  'https://check.net.vn/Data/product/mainimages/original/product3253.jpg',
              width: 100.w,
              height: 100.w,
            ),
            Text(
              'Cà rốt',
              style: StylesConstant.ts16w600
                  .copyWith(color: ColorsConstant.c04142C),
            )
          ],
        ),
      ),
    );
  }

  Row _searchAndFilterWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: TextfieldCustom(
            controller: TextEditingController(),
            isCircular: true,
            hintText: 'Tìm theo tên',
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
