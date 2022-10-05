import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/domain/entities/season_entity.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/detail_season/detail_season_page.dart';
import 'package:itrace_247/presentation/screen/list_season/bloc/list_season_bloc.dart';
import 'package:itrace_247/presentation/screen/utils_widget/drawer_filter_custom.dart';
import 'package:itrace_247/config/utils/assets.dart';

import 'package:itrace_247/config/utils/colors.dart';
import 'dart:developer';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';
import 'package:itrace_247/config/utils/styles.dart';

class ListSeasonPage extends StatefulWidget {
  const ListSeasonPage({
    super.key,
  });
  static const String routeName = '/ListSeasonPage';

  @override
  State<ListSeasonPage> createState() => _ListSeasonPageState();
}

class _ListSeasonPageState extends State<ListSeasonPage> {
  ValueNotifier<bool> isValueTab = ValueNotifier<bool>(false);
  ValueNotifier<bool> isSelecting = ValueNotifier<bool>(false);
  ValueNotifier<bool> isTypeSelect = ValueNotifier<bool>(false);
  ValueNotifier<bool> isStatus = ValueNotifier<bool>(false);
  ValueNotifier<List<int>> listSelected = ValueNotifier<List<int>>(<int>[]);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  final ListSeasonBloc listSeasonBloc = getIt();
  @override
  void initState() {
    listSeasonBloc.add(GetListSeasonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      keyScaffold: _scaffoldKey,
      appBar: appBarShared(
        context: context,
        S.of(context).seasonal_management,
      ),
      endDrawer: const DrawerFilterCustomWidget(),
      body: AnimatedBuilder(
        animation: Listenable.merge(
          <ValueNotifier<dynamic>>[isValueTab, listSelected],
        ),
        builder: (BuildContext context, _) => BlocProvider<ListSeasonBloc>(
          create: (_) => listSeasonBloc,
          child: Column(
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
      ),
    );
  }

  Widget _listPartnerWidget() {
    return BlocBuilder<ListSeasonBloc, ListSeasonState>(
      builder: (BuildContext context, ListSeasonState state) {
        if (state.getListSeasonState == LoadState.loading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        } else if (state.getListSeasonState == LoadState.success) {
          final List<SeaSonEntity> listSeason =
              state.listSeasons ?? <SeaSonEntity>[];
          return ListView.separated(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => InkWell(
              onTap: () =>
                  Navigator.pushNamed(context, DetailSeasonPage.routeName),
              child: Container(
                decoration: BoxDecoration(
                  color: ColorsConstant.cD3EAFF,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        listSeason[index].status == ' 1'
                            ? 'Đang hoạt động'
                            : 'Không hoạt động',
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
                              listSeason[index].name ?? '',
                              style: StylesConstant.ts18w500
                                  .copyWith(color: ColorsConstant.c04142C),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${listSeason[index].id} Vùng trồng',
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
              ),
            ),
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 16.h,
            ),
            itemCount: listSeason.length,
          );
        } else {
          return const Center(
            child: Text('Có lỗi xảy ra'),
          );
        }
      },
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
