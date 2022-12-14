import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';

import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';
import 'package:itrace_247/config/utils/validate.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/button_custom.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';

class BusinessAccountInfomationPage extends StatefulWidget {
  const BusinessAccountInfomationPage({super.key});
  static const String routeName = '/BusinessAccountInfomationPage';

  @override
  State<BusinessAccountInfomationPage> createState() =>
      _BusinessAccountInfomationPageState();
}

class _BusinessAccountInfomationPageState
    extends State<BusinessAccountInfomationPage> {
  TextEditingController txtFullname = TextEditingController();
  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtcity = TextEditingController();
  TextEditingController txtDistric = TextEditingController();
  TextEditingController txtWard = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  GlobalKey<FormState> keyBusinessAccountInfomation = GlobalKey<FormState>();
  GlobalKey<FormState> keyGeneralInformation = GlobalKey<FormState>();

  ValueNotifier<bool> isShowInputInfomation = ValueNotifier<bool>(false);
  ValueNotifier<bool> isShowInputAddress = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: appBarShared(
        context: context,
        S.of(context).register_for_a_business_account,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '???nh ?????i di???n',
              style: StylesConstant.ts18w500
                  .copyWith(color: ColorsConstant.c04142C),
            ),
            SizedBox(
              height: 24.h,
            ),
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 40.w,
                backgroundColor: ColorsConstant.cD3EAFF,
                child: Image.asset(PngAssets.imgPersonDefault),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ButtonCustom(
                params: CustomButtonParams.primary(
                  text: '?????i ???nh ?????i di???n',
                  backgroundColor: ColorsConstant.c0A89FE,
                  width: 155.w,
                  onPressed: () {
                    // AppImagePicker().pickImage(context);
                  },
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isShowInputInfomation,
              builder: (
                BuildContext context,
                bool valueShowInputInfomation,
                Widget? child,
              ) {
                return _itemBusinessAccountInfomationWidget(
                  onTap: () {
                    isShowInputInfomation.value = !isShowInputInfomation.value;
                  },
                  isShowComponent: valueShowInputInfomation,
                  title: 'Th??ng tin chung',
                  component: _componentAccountInfoWidget(),
                );
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            ValueListenableBuilder<bool>(
              valueListenable: isShowInputAddress,
              builder: (
                BuildContext context,
                bool valueShowInputAddress,
                Widget? child,
              ) {
                return _itemBusinessAccountInfomationWidget(
                  onTap: () {
                    isShowInputAddress.value = !isShowInputAddress.value;
                  },
                  isShowComponent: valueShowInputAddress,
                  title: 'Th??ng tin doanh nghi???p',
                  component: _componentAddressWidget(),
                );
              },
            ),
            SizedBox(
              height: 48.h,
            ),
            Align(
              alignment: Alignment.center,
              child: ButtonCustom(
                params: CustomButtonParams.primary(
                  text: 'Ho??n t???t',
                  backgroundColor: ColorsConstant.c0A89FE,
                  width: 155.w,
                  isCircular: true,
                  onPressed: () {
                    if (isShowInputAddress.value || isShowInputAddress.value) {
                      return;
                    } else {
                      isShowInputAddress.value = true;
                      isShowInputInfomation.value = true;
                    }
                    Future.delayed(
                        const Duration(
                          milliseconds: 200,
                        ), () {
                      keyBusinessAccountInfomation.currentState!.validate();
                      keyGeneralInformation.currentState!.validate();
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _componentAccountInfoWidget() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: keyBusinessAccountInfomation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextfieldCustom(
            title: 'T??n t??? ch???c/c?? nh??n',
            controller: txtFullname,
            hintText: 'Nh???p t??n ?????y ?????',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'S??? ??i???n tho???i',
            controller: txtPhoneNumber,
            hintText: 'Nh???p s??? ??i???n tho???i',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Email',
            controller: txtEmail,
            isObligatory: true,
            hintText: 'Nh???p ?????a ch??? email',
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'T???nh/Th??nh ph???',
            controller: txtcity,
            hintText: 'Ch???n t???nh,th??nh ph???',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Qu???n huy???n',
            controller: txtDistric,
            hintText: 'Ch???n qu???n huy???n',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Th??? x??',
            controller: txtWard,
            isObligatory: true,
            hintText: 'Ch???n th??? x??',
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            isObligatory: true,
            title: 'T??n ???????ng',
            controller: txtAddress,
            hintText: 'Nh???p t??n ???????ng',
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
        ],
      ),
    );
  }

  Widget _componentAddressWidget() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: keyGeneralInformation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextfieldCustom(
            title: 'N??m th??nh l???p',
            controller: txtcity,
            hintText: 'Nh???p n??m th??nh l???p',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'L??nh v???c kinh doanh',
            controller: txtDistric,
            hintText: 'Nh???p l??nh v???c kinh doanh',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'M?? s??? thu??? doanh nghi???p',
            controller: txtWard,
            hintText: 'Nh???p m?? s??? thu???',
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
        ],
      ),
    );
  }

  Widget _itemBusinessAccountInfomationWidget({
    required String title,
    required Widget component,
    required Function() onTap,
    required bool isShowComponent,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  title,
                  style: StylesConstant.ts18w500
                      .copyWith(color: ColorsConstant.c04142C),
                ),
                SvgPicture.asset(
                  isShowComponent
                      ? SvgAssets.icArrowUp2
                      : SvgAssets.icArrowDown,
                )
              ],
            ),
          ),
        ),
        if (isShowComponent)
          SizedBox(
            height: 24.h,
          ),
        if (isShowComponent) component
      ],
    );
  }
}
