import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:itrace_247/presentation/screen/list_cultivars_management/information_cultivars_bottom_sheet.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_item_tabbar.dart';
import 'package:itrace_247/presentation/screen/utils_widget/drawer_filter_custom.dart';
import 'package:itrace_247/config/utils/assets.dart';

import 'package:itrace_247/config/utils/colors.dart';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';
import 'package:itrace_247/config/utils/styles.dart';

class ListCultivarsPage extends StatefulWidget {
  const ListCultivarsPage({
    super.key,
  });
  static const String routeName = '/ListCultivarsPage';

  @override
  State<ListCultivarsPage> createState() => _ListCultivarsPageState();
}

class _ListCultivarsPageState extends State<ListCultivarsPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Radius radius8 = const Radius.circular(8);
  Radius radius0 = const Radius.circular(0);
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      keyScaffold: _scaffoldKey,
      appBar: appBarShared(context: context, S.of(context).list_of_cultivars),
      endDrawer: const DrawerFilterCustomWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: <Widget>[
            TabBar(
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.all(0),
              indicatorPadding: const EdgeInsets.all(0),
              controller: tabController,
              onTap: (int value) {
                setState(() {});
              },
              tabs: <Widget>[
                CustomItemTabbar(
                  title: S.of(context).seeds,
                  selected: tabController.index == 0,
                  indexItem: 0,
                ),
                CustomItemTabbar(
                  title: S.of(context).seedling,
                  indexItem: 1,
                  selected: tabController.index == 1,
                ),
              ],
            ),
            SizedBox(
              height: 32.h,
            ),
            _searchAndFilterWidget(),
            SizedBox(
              height: 24.h,
            ),
            SizedBox(
              width: double.infinity,
              height: double.maxFinite,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: <Widget>[
                  _listPartnerWidget(),
                  _listPartnerWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Tab _itemTabBar({required String title, required bool selected}) {
    return Tab(
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: StylesConstant.ts16w500.copyWith(
          color: selected ? ColorsConstant.cWhite : ColorsConstant.c0A89FE,
        ),
      ),
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
            return const InformationCultivarsWidget();
          },
        ),
        child: Container(
          decoration: BoxDecoration(
            color: ColorsConstant.cWhite,
            borderRadius: BorderRadius.circular(8.w),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  customCachedNetworkImage(
                    height: 80.w,
                    width: 80.w,
                    url:
                        'http://tamvietagri.vn/wp-content/uploads/2020/05/saurieng_giong-768x1024.jpg',
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Cây giống Sầu Riêng KAA',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: StylesConstant.ts16w600
                              .copyWith(color: ColorsConstant.c04142C),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          S.of(context).amount(90),
                          style: StylesConstant.ts14w600
                              .copyWith(color: ColorsConstant.c0A89FE),
                        ),
                      ],
                    ),
                  )
                ],
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
            isCircular: true,
            hintText: 'Tìm theo tên',
            prefixIcon: SvgPicture.asset(
              SvgAssets.icSearch,
              fit: BoxFit.scaleDown,
            ),
            colorHint: ColorsConstant.cBlack,
          ),
        ),
      ],
    );
  }
}
