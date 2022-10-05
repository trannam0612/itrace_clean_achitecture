import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/shared_preferences/shared_preferences_sevice.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_item.dart';
import 'package:itrace_247/config/storage_sevice.dart/storage_sevice.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/main.dart';
import 'package:itrace_247/presentation/bloc/app_bloc.dart';
import 'package:itrace_247/presentation/screen/account_information/account_information_page.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/individual/bloc/individual_bloc.dart';
import 'package:itrace_247/presentation/screen/login/login_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key});
  static const String routeName = '/IndividualPage';

  @override
  State<IndividualPage> createState() => IindividualPageState();
}

class IindividualPageState extends State<IndividualPage> {
  final StorageService _storageService = getIt();

  final IndividualBloc _individualBloc = getIt();
  @override
  void initState() {
    // context.read<IndividualBloc>().add(GetInfoUserEvent());
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar:
          appBarShared(context: context, 'Cá nhân', isShowBackButton: false),
      body: BlocProvider<IndividualBloc>(
        create: (BuildContext context) =>
            _individualBloc..add(GetInfoUserEvent()),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (BuildContext context, AppState appState) {
          return BlocBuilder<IndividualBloc, IndividualState>(
            builder: (BuildContext context, IndividualState state) {
              UserEntity? userEntity;

                if (appState.updatedUserInfoState == LoadState.success) {
                  userEntity = appState.userEntity;
                } else {
                  userEntity = state.userEntity;
                }
                return Padding(
                  padding: EdgeInsets.all(24.w),
                  child: Column(
                    children: <Widget>[
                      _accountInfomationWidget(),
                      _itemIindividualWidget(
                        title: 'Thông tin tài khoản',
                        icon: SvgAssets.icIdCard,
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            AccountInfomationPage.routeName,
                            arguments:
                                AccountInfomationArg(userEntity: userEntity),
                          );
                        },
                      ),
                      _itemIindividualWidget(
                        title: 'Doanh nghiệp quản lý',
                        icon: SvgAssets.icSupport,
                      onPress: () {
                        // Navigator.pushNamed(context, ListPartnerPage.routeName);
                      },
                    ),
                    _itemIindividualWidget(
                      title: 'Tạo mã đăng nhập',
                      icon: SvgAssets.icBarCode,
                    ),
                    _itemIindividualWidget(
                      title: 'Cài đặt ứng dụng',
                      icon: SvgAssets.icSetting,
                    ),
                    _exitWidget()
                  ],
                ),
              );
            },
          );
        },
        ),
      ),
    );
  }

  Widget _accountInfomationWidget() {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          BlocBuilder<AppBloc, AppState>(
            builder: (BuildContext context, AppState appState) {
              return BlocBuilder<IndividualBloc, IndividualState>(
                builder: (BuildContext context, IndividualState state) {
                  // final String urlImage =
                  //     'http://itrace247.cssdemoco.com/storage/${state.userEntity?.avatar}';
                  // log('urlImage:${urlImage}');
                  String? urlImage;

                  if (appState.updatedUserInfoState == LoadState.success) {
                    urlImage =
                        'http://itrace247.cssdemoco.com/storage/${appState.userEntity?.avatar}';
                  } else {
                    urlImage =
                        'http://itrace247.cssdemoco.com/storage/${state.userEntity?.avatar}';
                  }
                  if (state.getUserInforState == LoadState.loading ||
                      appState.updatedUserInfoState == LoadState.loading) {
                    return SizedBox(
                      height: 40.w,
                      width: 40.w,
                      child: const Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    );
                  } else if (state.getUserInforState == LoadState.success ||
                      appState.updatedUserInfoState == LoadState.success) {
                    return customCachedNetworkImage(
                      height: 40.w,
                      width: 40.w,
                      url: urlImage,
                    );
                  } else {
                    return CircleAvatar(
                      radius: 40.w,
                      backgroundColor: ColorsConstant.cD3EAFF,
                      child: Image.asset(PngAssets.imgPersonDefault),
                    );
                  }
                },
              );
            },
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BlocBuilder<AppBloc, AppState>(
                  bloc: context.read<AppBloc>(),
                  builder: (BuildContext context, AppState appState) {
                    log('state of AppBloc:${appState.userEntity?.name ?? ''}');
                    return BlocBuilder<IndividualBloc, IndividualState>(
                      builder: (BuildContext context, IndividualState state) {
                        String userName = '';

                        // if (appState.updatedUserInfoState ==
                        //     LoadState.success) {
                        //   userName = appState.userEntity?.name ?? "";
                        // } else {
                        userName = state.userEntity?.name ?? "";
                        // }
                        return Text(
                          state.getUserInforState == LoadState.success
                              ? userName
                              : '',
                          style: StylesConstant.ts16w600,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  S.of(context).farmer,
                  style: StylesConstant.ts14w600
                      .copyWith(color: ColorsConstant.c9E9E9E),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _exitWidget() {
    return GestureDetector(
      onTap: () async {
        log('Thoát tài khoản');
        await _storageService.deleteSecureData(StorageItem('token', ''));
        Navigator.pushNamedAndRemoveUntil(
          keyScaffold.currentState!.context,
          LoginPage.routeName,
          (Route<dynamic> route) => false,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorsConstant.c0A89FE,
          borderRadius: BorderRadius.circular(8.w),
        ),
        padding: EdgeInsets.all(24.h),
        child: Row(
          children: <Widget>[
            SvgPicture.asset(SvgAssets.icArrowRight2),
            SizedBox(
              width: 16.w,
            ),
            Text(
              'Thoát tài khoản',
              style: StylesConstant.ts16w600
                  .copyWith(color: ColorsConstant.cWhite),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemIindividualWidget({
    required String title,
    required String icon,
    Function()? onPress,
  }) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: ColorsConstant.cWhite,
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          padding: EdgeInsets.all(24.h),
          child: Row(
            children: <Widget>[
              SvgPicture.asset(icon),
              SizedBox(
                width: 16.w,
              ),
              Text(
                title,
                style: StylesConstant.ts16w600,
              ),
              const Spacer(),
              SvgPicture.asset(SvgAssets.icArrowRight),
            ],
          ),
        ),
      ),
    );
  }
}
