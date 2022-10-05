// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `To login please enter identification code (PIN) of 6 digits`
  String get title_input_pin {
    return Intl.message(
      'To login please enter identification code (PIN) of 6 digits',
      name: 'title_input_pin',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Click here if you forgot your PIN`
  String get click_here_if_you_forgot_your_PIN {
    return Intl.message(
      'Click here if you forgot your PIN',
      name: 'click_here_if_you_forgot_your_PIN',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách cây trồng/hoa màu`
  String get list_of_plants_crops {
    return Intl.message(
      'Danh sách cây trồng/hoa màu',
      name: 'list_of_plants_crops',
      desc: '',
      args: [],
    );
  }

  /// `Register for a business account`
  String get register_for_a_business_account {
    return Intl.message(
      'Register for a business account',
      name: 'register_for_a_business_account',
      desc: '',
      args: [],
    );
  }

  /// `List seasons`
  String get list_seasons {
    return Intl.message(
      'List seasons',
      name: 'list_seasons',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết mùa vụ`
  String get detail_season {
    return Intl.message(
      'Chi tiết mùa vụ',
      name: 'detail_season',
      desc: '',
      args: [],
    );
  }

  /// `Chi tiết vùng trồng`
  String get planting_area_details {
    return Intl.message(
      'Chi tiết vùng trồng',
      name: 'planting_area_details',
      desc: '',
      args: [],
    );
  }

  /// `Quản lý kho`
  String get warehouse_management {
    return Intl.message(
      'Quản lý kho',
      name: 'warehouse_management',
      desc: '',
      args: [],
    );
  }

  /// `Kho, nơi lưu trữ các loại vật tư, thiết bị cần thiết cho việc trồng trọt`
  String get title_warehouse_management_page {
    return Intl.message(
      'Kho, nơi lưu trữ các loại vật tư, thiết bị cần thiết cho việc trồng trọt',
      name: 'title_warehouse_management_page',
      desc: '',
      args: [],
    );
  }

  /// `Vật tư, thiết bị, dụng cụ`
  String get materials_equipment_tools {
    return Intl.message(
      'Vật tư, thiết bị, dụng cụ',
      name: 'materials_equipment_tools',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách giống cây trồng`
  String get list_of_cultivars {
    return Intl.message(
      'Danh sách giống cây trồng',
      name: 'list_of_cultivars',
      desc: '',
      args: [],
    );
  }

  /// `Sản phẩm sau thu hoạch`
  String get post_harvest_products {
    return Intl.message(
      'Sản phẩm sau thu hoạch',
      name: 'post_harvest_products',
      desc: '',
      args: [],
    );
  }

  /// `Số lượng : {total}`
  String amount(int total) {
    return Intl.message(
      'Số lượng : $total',
      name: 'amount',
      desc: '',
      args: [total],
    );
  }

  /// `Supplies`
  String get supplies {
    return Intl.message(
      'Supplies',
      name: 'supplies',
      desc: '',
      args: [],
    );
  }

  /// `Tool`
  String get tool {
    return Intl.message(
      'Tool',
      name: 'tool',
      desc: '',
      args: [],
    );
  }

  /// `Equipment`
  String get equipment {
    return Intl.message(
      'Equipment',
      name: 'equipment',
      desc: '',
      args: [],
    );
  }

  /// `Đặc điểm`
  String get characteristics {
    return Intl.message(
      'Đặc điểm',
      name: 'characteristics',
      desc: '',
      args: [],
    );
  }

  /// `Hạt giống`
  String get seeds {
    return Intl.message(
      'Hạt giống',
      name: 'seeds',
      desc: '',
      args: [],
    );
  }

  /// `Cây giống`
  String get seedling {
    return Intl.message(
      'Cây giống',
      name: 'seedling',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mã pin`
  String get please_enter_the_pin_code {
    return Intl.message(
      'Vui lòng nhập mã pin',
      name: 'please_enter_the_pin_code',
      desc: '',
      args: [],
    );
  }

  /// `Quản lý mùa vụ`
  String get seasonal_management {
    return Intl.message(
      'Quản lý mùa vụ',
      name: 'seasonal_management',
      desc: '',
      args: [],
    );
  }

  /// `Quản lý thiết bị vật tư`
  String get management_of_equipment_and_materials {
    return Intl.message(
      'Quản lý thiết bị vật tư',
      name: 'management_of_equipment_and_materials',
      desc: '',
      args: [],
    );
  }

  /// `Danh sách thu hoạch`
  String get harvest_list {
    return Intl.message(
      'Danh sách thu hoạch',
      name: 'harvest_list',
      desc: '',
      args: [],
    );
  }

  /// `Hộ nông dân`
  String get farmer {
    return Intl.message(
      'Hộ nông dân',
      name: 'farmer',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin tài khoản`
  String get accountInformation {
    return Intl.message(
      'Thông tin tài khoản',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `Ảnh đại diện`
  String get avatar {
    return Intl.message(
      'Ảnh đại diện',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `Đổi ảnh đại diện`
  String get changeAvatar {
    return Intl.message(
      'Đổi ảnh đại diện',
      name: 'changeAvatar',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
