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

  /// `Danh s??ch c??y tr???ng/hoa m??u`
  String get list_of_plants_crops {
    return Intl.message(
      'Danh s??ch c??y tr???ng/hoa m??u',
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

  /// `Chi ti???t m??a v???`
  String get detail_season {
    return Intl.message(
      'Chi ti???t m??a v???',
      name: 'detail_season',
      desc: '',
      args: [],
    );
  }

  /// `Chi ti???t v??ng tr???ng`
  String get planting_area_details {
    return Intl.message(
      'Chi ti???t v??ng tr???ng',
      name: 'planting_area_details',
      desc: '',
      args: [],
    );
  }

  /// `Qu???n l?? kho`
  String get warehouse_management {
    return Intl.message(
      'Qu???n l?? kho',
      name: 'warehouse_management',
      desc: '',
      args: [],
    );
  }

  /// `Kho, n??i l??u tr??? c??c lo???i v???t t??, thi???t b??? c???n thi???t cho vi???c tr???ng tr???t`
  String get title_warehouse_management_page {
    return Intl.message(
      'Kho, n??i l??u tr??? c??c lo???i v???t t??, thi???t b??? c???n thi???t cho vi???c tr???ng tr???t',
      name: 'title_warehouse_management_page',
      desc: '',
      args: [],
    );
  }

  /// `V???t t??, thi???t b???, d???ng c???`
  String get materials_equipment_tools {
    return Intl.message(
      'V???t t??, thi???t b???, d???ng c???',
      name: 'materials_equipment_tools',
      desc: '',
      args: [],
    );
  }

  /// `Danh s??ch gi???ng c??y tr???ng`
  String get list_of_cultivars {
    return Intl.message(
      'Danh s??ch gi???ng c??y tr???ng',
      name: 'list_of_cultivars',
      desc: '',
      args: [],
    );
  }

  /// `S???n ph???m sau thu ho???ch`
  String get post_harvest_products {
    return Intl.message(
      'S???n ph???m sau thu ho???ch',
      name: 'post_harvest_products',
      desc: '',
      args: [],
    );
  }

  /// `S??? l?????ng : {total}`
  String amount(int total) {
    return Intl.message(
      'S??? l?????ng : $total',
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

  /// `?????c ??i???m`
  String get characteristics {
    return Intl.message(
      '?????c ??i???m',
      name: 'characteristics',
      desc: '',
      args: [],
    );
  }

  /// `H???t gi???ng`
  String get seeds {
    return Intl.message(
      'H???t gi???ng',
      name: 'seeds',
      desc: '',
      args: [],
    );
  }

  /// `C??y gi???ng`
  String get seedling {
    return Intl.message(
      'C??y gi???ng',
      name: 'seedling',
      desc: '',
      args: [],
    );
  }

  /// `Vui l??ng nh???p m?? pin`
  String get please_enter_the_pin_code {
    return Intl.message(
      'Vui l??ng nh???p m?? pin',
      name: 'please_enter_the_pin_code',
      desc: '',
      args: [],
    );
  }

  /// `Qu???n l?? m??a v???`
  String get seasonal_management {
    return Intl.message(
      'Qu???n l?? m??a v???',
      name: 'seasonal_management',
      desc: '',
      args: [],
    );
  }

  /// `Qu???n l?? thi???t b??? v???t t??`
  String get management_of_equipment_and_materials {
    return Intl.message(
      'Qu???n l?? thi???t b??? v???t t??',
      name: 'management_of_equipment_and_materials',
      desc: '',
      args: [],
    );
  }

  /// `Danh s??ch thu ho???ch`
  String get harvest_list {
    return Intl.message(
      'Danh s??ch thu ho???ch',
      name: 'harvest_list',
      desc: '',
      args: [],
    );
  }

  /// `H??? n??ng d??n`
  String get farmer {
    return Intl.message(
      'H??? n??ng d??n',
      name: 'farmer',
      desc: '',
      args: [],
    );
  }

  /// `Th??ng tin t??i kho???n`
  String get accountInformation {
    return Intl.message(
      'Th??ng tin t??i kho???n',
      name: 'accountInformation',
      desc: '',
      args: [],
    );
  }

  /// `???nh ?????i di???n`
  String get avatar {
    return Intl.message(
      '???nh ?????i di???n',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `?????i ???nh ?????i di???n`
  String get changeAvatar {
    return Intl.message(
      '?????i ???nh ?????i di???n',
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
