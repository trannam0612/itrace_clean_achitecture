import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';

import 'package:itrace_247/presentation/screen/account_information/account_information_page.dart';
import 'package:itrace_247/presentation/screen/bottom_navigator/bottom_navigator_page.dart';
import 'package:itrace_247/presentation/screen/business_account_information/business_account_information_page.dart';
import 'package:itrace_247/presentation/screen/crop_manage/crop_manage_page.dart';
import 'package:itrace_247/presentation/screen/detail_season/detail_season_page.dart';
import 'package:itrace_247/presentation/screen/diary/diary_page.dart';
import 'package:itrace_247/presentation/screen/home/home_page.dart';
import 'package:itrace_247/presentation/screen/individual/bloc/individual_bloc.dart';
import 'package:itrace_247/presentation/screen/individual/individual_page.dart';
import 'package:itrace_247/presentation/screen/list_crops/list_crops_page.dart';
import 'package:itrace_247/presentation/screen/list_cultivars_management/list_cultivars_management_page.dart';
import 'package:itrace_247/presentation/screen/list_equipment_material_management/list_equipment_material_management_page.dart';
import 'package:itrace_247/presentation/screen/list_harvest/list_harvest_page.dart';
import 'package:itrace_247/presentation/screen/list_season/list_season_page.dart';
import 'package:itrace_247/presentation/screen/login/login_page.dart';
import 'package:itrace_247/presentation/screen/notification/notification_page.dart';
import 'package:itrace_247/presentation/screen/planting_area_detail/planting_area_detail_page.dart';
import 'package:itrace_247/presentation/screen/scan/scan_page.dart';
import 'package:itrace_247/presentation/screen/season_manage/season_manage_page.dart';
import 'package:itrace_247/presentation/screen/warehouse_management/warehouse_management_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    log('Screen Name: ${settings.name}');
    final IndividualBloc _individualBloc = getIt();

    switch (settings.name) {
      // case MyHomePage.routeName:
      //   return MaterialPageRoute<MyHomePage>(
      //     builder: (_) => const MyHomePage(),
      //     settings: settings,
      //   );
      case LoginPage.routeName:
        return MaterialPageRoute<LoginPage>(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

      case HomePage.routeName:
        return MaterialPageRoute<HomePage>(
          builder: (_) => const HomePage(),
          settings: settings,
        );
      case NotificationPage.routeName:
        return MaterialPageRoute<NotificationPage>(
          builder: (_) => const NotificationPage(),
          settings: settings,
        );
      case IndividualPage.routeName:
        return MaterialPageRoute<IndividualPage>(
          builder: (_) =>  const IndividualPage(),
          
          settings: settings,
        );
      case ScanPage.routeName:
        return MaterialPageRoute<ScanPage>(
          builder: (_) => const ScanPage(),
          settings: settings,
        );
      case BottomNavigatorPage.routeName:
        return MaterialPageRoute<BottomNavigatorPage>(
          builder: (_) => const BottomNavigatorPage(),
          settings: settings,
        );
      case AccountInfomationPage.routeName:
        AccountInfomationArg accountInfomationArg =
            settings.arguments as AccountInfomationArg;
        return MaterialPageRoute<AccountInfomationPage>(
          builder: (_) => BlocProvider<IndividualBloc>(
            create: (BuildContext context) => _individualBloc,
            child: AccountInfomationPage(
              accountInfomationArg: accountInfomationArg,
            ),
          ),
          settings: settings,
        );
      case DiaryPage.routeName:
        return MaterialPageRoute<DiaryPage>(
          builder: (_) => const DiaryPage(),
          settings: settings,
        );

      case ListCropsPage.routeName:
        return MaterialPageRoute<ListCropsPage>(
          builder: (_) => const ListCropsPage(),
          settings: settings,
        );
      case CropManagePage.routeName:
        return MaterialPageRoute<CropManagePage>(
          builder: (_) => const CropManagePage(),
          settings: settings,
        );
      case SeasonManagePage.routeName:
        return MaterialPageRoute<SeasonManagePage>(
          builder: (_) => const SeasonManagePage(),
          settings: settings,
        );
      case BusinessAccountInfomationPage.routeName:
        return MaterialPageRoute<BusinessAccountInfomationPage>(
          builder: (_) => const BusinessAccountInfomationPage(),
          settings: settings,
        );
      case ListSeasonPage.routeName:
        return MaterialPageRoute<ListSeasonPage>(
          builder: (_) => const ListSeasonPage(),
          settings: settings,
        );
      case DetailSeasonPage.routeName:
        return MaterialPageRoute<DetailSeasonPage>(
          builder: (_) => const DetailSeasonPage(),
          settings: settings,
        );
      case PlantingAreaPage.routeName:
        return MaterialPageRoute<PlantingAreaPage>(
          builder: (_) => const PlantingAreaPage(),
          settings: settings,
        );

      //Warehouse
      case WarehouseManagementPage.routeName:
        return MaterialPageRoute<WarehouseManagementPage>(
          builder: (_) => const WarehouseManagementPage(),
          settings: settings,
        );
      //Quản lý thiết bị vật tư
      case ListEquipmentMaterialManagementPage.routeName:
        return MaterialPageRoute<ListEquipmentMaterialManagementPage>(
          builder: (_) => const ListEquipmentMaterialManagementPage(),
          settings: settings,
        );

      //Danh sách giống cây trồng
      case ListCultivarsPage.routeName:
        return MaterialPageRoute<ListCultivarsPage>(
          builder: (_) => const ListCultivarsPage(),
          settings: settings,
        );
      //Danh cây trồng sau thu hoạch
      case ListHarvestPage.routeName:
        return MaterialPageRoute<ListHarvestPage>(
          builder: (_) => const ListHarvestPage(),
          settings: settings,
        );

      default:
        return MaterialPageRoute<Scaffold>(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
          settings: settings,
        );
    }
  }
}
