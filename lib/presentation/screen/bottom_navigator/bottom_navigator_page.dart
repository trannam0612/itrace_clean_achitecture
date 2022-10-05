import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/config/routes.dart';

import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/main.dart';
import 'package:itrace_247/presentation/screen/diary/diary_page.dart';
import 'package:itrace_247/presentation/screen/home/home_page.dart';
import 'package:itrace_247/presentation/screen/individual/individual_page.dart';
import 'package:itrace_247/presentation/screen/scan/scan_page.dart';

class BottomNavigatorPage extends StatefulWidget {
  const BottomNavigatorPage({super.key, this.pageIndex});
  static const String routeName = '/BottomNavigatorPage';
  final int? pageIndex;

  @override
  State<BottomNavigatorPage> createState() => _BottomNavigatorPageState();
}

class _BottomNavigatorPageState extends State<BottomNavigatorPage> {
  @override
  void initState() {
    selectedIndex = widget.pageIndex ?? 0;
    super.initState();
  }

  int selectedIndex = 0;
  void onNavigateScreen({required String path, bool? isCurrentPage}) {
    Navigator.pushNamed(
      keyBottomNavibar.currentState!.context,
      path,
    );
  }

  void refreshPage({required String path}) {
    Navigator.popUntil(
      keyBottomNavibar.currentState!.context,
      (route) => route.settings.name == path,
    );
  }

  void onTapHandler(int index) {
    setState(() {
      if (selectedIndex == index) {
        switch (index) {
          case 0:
            refreshPage(path: HomePage.routeName);
            break;
          case 1:
            refreshPage(path: ScanPage.routeName);
            break;
          case 2:
            refreshPage(path: DiaryPage.routeName);
            break;
          case 3:
            refreshPage(path: IndividualPage.routeName);
            break;
          default:
            refreshPage(path: HomePage.routeName);
            break;
        }
      } else {
        switch (index) {
          case 0:
            onNavigateScreen(path: HomePage.routeName);
            break;
          case 1:
            onNavigateScreen(path: ScanPage.routeName);
            break;
          case 2:
            onNavigateScreen(path: DiaryPage.routeName);
            break;
          case 3:
            onNavigateScreen(path: IndividualPage.routeName);
            break;
          default:
            onNavigateScreen(path: HomePage.routeName);
            break;
        }
      }
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      bottomNavigationBar: _navibarWidget(),
      body: Navigator(
        key: keyBottomNavibar,
        initialRoute: HomePage.routeName,
        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }

  Widget _navibarWidget() {
    return BottomNavigationBar(
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(SvgAssets.icHome),
          activeIcon: SvgPicture.asset(SvgAssets.icHomeActive),
          label: "Trang chủ",
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(SvgAssets.icScanActive),
          icon: SvgPicture.asset(SvgAssets.icScan),
          label: "Truy xuất",
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(SvgAssets.icNoteActive),
          icon: SvgPicture.asset(SvgAssets.icNote),
          label: "Nhật ký",
        ),
        BottomNavigationBarItem(
          activeIcon: SvgPicture.asset(SvgAssets.icUserActive),
          icon: SvgPicture.asset(SvgAssets.icUser),
          label: "Cá nhân",
        )
      ],
      onTap: (int index) {
        onTapHandler(index);
      },
    );
  }
}
