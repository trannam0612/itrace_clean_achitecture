import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/config/utils/styles.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/bottom_navigator/bottom_navigator_page.dart';
import 'package:itrace_247/presentation/screen/login/bloc/login_bloc.dart';
import 'package:itrace_247/presentation/screen/login/component/dialog_infomation_business.dart';
import 'package:itrace_247/presentation/screen/utils_widget/button_custom.dart';
import 'package:itrace_247/presentation/screen/login/component/error_message_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/intput_pin_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const String routeName = '/LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static TextEditingController txtPin = TextEditingController();
  final LoginBloc _loginBloc = getIt();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: BlocProvider<LoginBloc>(
        create: (BuildContext context) => _loginBloc,
        child: BlocListener<LoginBloc, LoginState>(
          listenWhen: (LoginState previous, LoginState current) =>
              previous.loginState != current.loginState,
          listener: (BuildContext context, LoginState state) {
            if (state.loginState == LoadState.loading) {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              );
            } else if (state.loginState == LoadState.success) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                BottomNavigatorPage.routeName,
                (Route<dynamic> route) => false,
              );
            } else if (state.loginState == LoadState.failure) {
              Future<void>.delayed(const Duration(milliseconds: 200), () {
                txtPin.clear();
              });
              Navigator.pop(context);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 82.h),
            child: Column(
              children: <Widget>[
                Image.asset(
                  PngAssets.imgLogoTitle,
                  fit: BoxFit.contain,
                  width: 144.w,
                  height: 162.h,
                ),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  S.of(context).click_here_if_you_forgot_your_PIN,
                  style: StylesConstant.ts18w500,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 32.h,
                ),
                _buildInputPin(),
                SizedBox(
                  height: 32.h,
                ),
                _buildButtonLogin(context),
                _buildErrorMessage(),
                _buildForgotPin(context),
                SizedBox(
                  height: 42.h,
                ),
                Text(
                  'Bạn là doanh nghiệp?',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StylesConstant.ts16w500
                      .copyWith(color: ColorsConstant.cFF951A),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const DialogInfomationBusiness(),
                    );
                  },
                  label: Text(
                    'Vui lòng bấm vào đây để được hỗ trợ thông tin của doanh nghiệp',
                    style: StylesConstant.ts18w500
                        .copyWith(color: ColorsConstant.c0A89FE),
                    textAlign: TextAlign.center,
                  ),
                  icon: SvgPicture.asset(SvgAssets.icArrowLeft),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextButton _buildForgotPin(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => const DialogInfomationBusiness(),
        );
      },
      label: Text(
        S.of(context).click_here_if_you_forgot_your_PIN,
        style: StylesConstant.ts18w500.copyWith(color: ColorsConstant.c0A89FE),
      ),
      icon: SvgPicture.asset(SvgAssets.icArrowLeft),
    );
  }

  BlocBuilder<LoginBloc, LoginState> _buildErrorMessage() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, LoginState state) {
        return ErrorMessgaeWidget(
          errorMessage:
              txtPin.text.isEmpty && state.loginState == LoadState.failure
                  ? S.of(context).please_enter_the_pin_code
                  : state.message ?? '',
        );
      },
    );
  }

  ButtonCustom _buildButtonLogin(BuildContext context) {
    return ButtonCustom(
      params: CustomButtonParams.primary(
        text: S.of(context).login,
        backgroundColor: ColorsConstant.c00C753,
        isCircular: true,
        width: 191.w,
        onPressed: () {
          _loginBloc.add(ConfirmPinCodeEvent(pinCode: txtPin.text));
        },
      ),
    );
  }

  BlocBuilder<LoginBloc, LoginState> _buildInputPin() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (BuildContext context, LoginState state) {
        return InPutPinWidget(
          key: UniqueKey(),
          txtPin: txtPin,
          errorInput: state.loginState == LoadState.failure,
        );
      },
    );
  }
}
