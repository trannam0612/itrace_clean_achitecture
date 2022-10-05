import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:itrace_247/presentation/screen/list_equipment_material_management/information_equipment_bottom_sheet.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/drawer_filter_custom.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';
import 'package:itrace_247/config/utils/styles.dart';

class ListEquipmentMaterialManagementPage extends StatefulWidget {
  const ListEquipmentMaterialManagementPage({
    super.key,
  });
  static const String routeName = '/ListEquipmentMaterialManagementPage';

  @override
  State<ListEquipmentMaterialManagementPage> createState() =>
      _ListEquipmentMaterialManagementPageState();
}

class _ListEquipmentMaterialManagementPageState
    extends State<ListEquipmentMaterialManagementPage>
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
      length: 3,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      keyScaffold: _scaffoldKey,
      appBar: appBarShared(
        context: context,
        S.of(context).management_of_equipment_and_materials,
      ),
      endDrawer: const DrawerFilterCustomWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
        child: Column(
          children: <Widget>[
            TabBar(
              tabs: <Widget>[
                _itemTabBar(
                  title: S.of(context).supplies,
                  selected: tabController.index == 0,
                  currentIndex: 0,
                ),
                _itemTabBar(
                  title: S.of(context).tool,
                  selected: tabController.index == 1,
                  currentIndex: 1,
                ),
                _itemTabBar(
                  title: S.of(context).equipment,
                  selected: tabController.index == 2,
                  currentIndex: 2,
                ),
              ],
              indicatorColor: Colors.transparent,
              labelPadding: const EdgeInsets.all(0),
              indicatorPadding: const EdgeInsets.all(0),
              controller: tabController,
              onTap: (int value) {
                setState(() {});
              },
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
                controller: tabController,
                children: <Widget>[
                  _listPartnerWidget(),
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
            return const InformationEquipemntWidget();
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
                        'https://vtv1.mediacdn.vn/2021/5/27/ngo-doc-thuoc-tru-sau-16220560560061601398877.jpg',
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Thuốc kháng sâu mọt',
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

  Widget _itemTabBar({
    required String title,
    required bool selected,
    int? currentIndex,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: !selected ? ColorsConstant.c0A89FE : Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: currentIndex == 0 ? radius8 : radius0,
          bottomLeft: currentIndex == 0 ? radius8 : radius0,
          topRight: currentIndex == 2 ? radius8 : radius0,
          bottomRight: currentIndex == 2 ? radius8 : radius0,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(
          left: tabController.index == 0 ? 1 : 0,
          right: tabController.index == 2 ? 1 : 0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: currentIndex == 0 ? radius8 : radius0,
            bottomLeft: currentIndex == 0 ? radius8 : radius0,
            topRight: currentIndex == 2 ? radius8 : radius0,
            bottomRight: currentIndex == 2 ? radius8 : radius0,
          ),
          color: selected ? ColorsConstant.c0A89FE : ColorsConstant.cD3EAFF,
        ),
        child: Tab(
          icon: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: StylesConstant.ts16w500.copyWith(
              color: selected ? ColorsConstant.cWhite : ColorsConstant.c0A89FE,
            ),
          ),
        ),
      ),
    );
  }
}
