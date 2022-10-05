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
              'Ảnh đại diện',
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
                  text: 'Đổi ảnh đại diện',
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
                  title: 'Thông tin chung',
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
                  title: 'Thông tin doanh nghiệp',
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
                  text: 'Hoàn tất',
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
            title: 'Tên tổ chức/cá nhân',
            controller: txtFullname,
            hintText: 'Nhập tên đầy đủ',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Số điện thoại',
            controller: txtPhoneNumber,
            hintText: 'Nhập số điện thoại',
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
            hintText: 'Nhập địa chỉ email',
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Tỉnh/Thành phố',
            controller: txtcity,
            hintText: 'Chọn tỉnh,thành phố',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Quận huyện',
            controller: txtDistric,
            hintText: 'Chọn quận huyện',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Thị xã',
            controller: txtWard,
            isObligatory: true,
            hintText: 'Chọn thị xã',
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            isObligatory: true,
            title: 'Tên đường',
            controller: txtAddress,
            hintText: 'Nhập tên đường',
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
            title: 'Năm thành lập',
            controller: txtcity,
            hintText: 'Nhập năm thành lập',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Lĩnh vực kinh doanh',
            controller: txtDistric,
            hintText: 'Nhập lĩnh vực kinh doanh',
            isObligatory: true,
            validator: (String? value) =>
                getIt<ValidateCustom>().validatorEmpty(value: value),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Mã số thuế doanh nghiệp',
            controller: txtWard,
            hintText: 'Nhập mã số thuế',
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
