import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/image_picker_config/image_picker_config.dart';
import 'package:itrace_247/config/image_picker_config/my_file_model.dart';

import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/config/utils/styles.dart';
import 'package:itrace_247/config/utils/validate.dart';
import 'package:itrace_247/domain/entities/address/province_entity.dart';
import 'package:itrace_247/domain/entities/user_entity.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/main.dart';
import 'package:itrace_247/presentation/screen/account_information/bloc/account_information_bloc.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/bottom_navigator/bottom_navigator_page.dart';
import 'package:itrace_247/presentation/screen/home/home_page.dart';
import 'package:itrace_247/presentation/screen/individual/bloc/individual_bloc.dart';
import 'package:itrace_247/presentation/screen/individual/individual_page.dart';
import 'package:itrace_247/presentation/screen/select_address/address_model.dart';
import 'package:itrace_247/presentation/screen/select_address/select_address_bottom_sheet.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';
import 'package:itrace_247/presentation/screen/utils_widget/button_custom.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_bottom_sheet.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_dialog.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';

class AccountInfomationArg {
  AccountInfomationArg({required this.userEntity});

  final UserEntity? userEntity;
}

class AccountInfomationPage extends StatefulWidget {
  const AccountInfomationPage({super.key, required this.accountInfomationArg});
  static const String routeName = '/AccountInfomationPage';
  final AccountInfomationArg accountInfomationArg;

  @override
  State<AccountInfomationPage> createState() => _AccountInfomationPageState();
}

class _AccountInfomationPageState extends State<AccountInfomationPage> {
  TextEditingController txtFullname = TextEditingController();
  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtcity = TextEditingController();
  TextEditingController txtDistrict = TextEditingController();
  TextEditingController txtWard = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  GlobalKey<FormState> keyAccountInfomation = GlobalKey<FormState>();
  GlobalKey<FormState> keyAddress = GlobalKey<FormState>();

  ValueNotifier<bool> isShowInputInfomation = ValueNotifier<bool>(false);
  ValueNotifier<bool> isShowInputAddress = ValueNotifier<bool>(false);
  //value check show error complete
  ValueNotifier<bool> isCompleteAddress = ValueNotifier<bool>(false);
  ValueNotifier<bool> isCompleteInfomation = ValueNotifier<bool>(false);
  int? idProvince;
  int? idDistrict;
  int? idWard;

  File? avatar;

  final AccountInformationBloc _accountInformationBloc = getIt();

  @override
  void initState() {
    final UserEntity userEntity =
        widget.accountInfomationArg.userEntity ?? UserEntity();
    txtFullname.text = userEntity.name ?? '';
    txtPhoneNumber.text = userEntity.phone ?? '';
    txtEmail.text = userEntity.email ?? '';
    txtcity.text = userEntity.province?.name ?? '';
    txtDistrict.text = userEntity.district?.name ?? '';
    txtWard.text = userEntity.ward?.name ?? '';
    txtAddress.text = userEntity.address ?? '';
    idProvince = userEntity.province?.id;
    idDistrict = userEntity.district?.id;
    idWard = userEntity.ward?.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await Navigator.pushNamed(context, HomePage.routeName);
        return true;
      },
      child: BasePage(
        appBar: appBarShared(
          context: context,
          S.of(context).accountInformation,
        ),
        body: AnimatedBuilder(
          animation: Listenable.merge(
            <ValueNotifier<dynamic>>[
              isShowInputInfomation,
              isShowInputAddress,
              isCompleteAddress,
              isCompleteInfomation
            ],
          ),
          builder: (BuildContext context, _) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
            child: BlocProvider<AccountInformationBloc>(
              create: (BuildContext context) => _accountInformationBloc,
              child:
                  BlocListener<AccountInformationBloc, AccountInformationState>(
                listener:
                    (BuildContext context, AccountInformationState state) {
                  if (state.updateUserInfoState == LoadState.success) {
                    showCustomDialog(
                      context: context,
                      options: CustomDialogParams.simpleAlert(
                        image: Image.asset(
                          PngAssets.imgCheckmarkStarburst,
                          fit: BoxFit.scaleDown,
                          height: 80.w,
                          width: 80.w,
                        ),
                        message:
                            '''Cảm ơn bạn đã hoàn thiện thông tin cá nhân của mình''',
                        negativeTitle: 'Đóng',
                        onPressed: () => Navigator.popUntil(
                          context,
                          (Route<dynamic> route) =>
                              route.settings.name == IndividualPage.routeName,
                        ),
                      ),
                    );
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      S.of(context).avatar,
                      style: StylesConstant.ts18w500
                          .copyWith(color: ColorsConstant.c04142C),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: customCachedNetworkImage(
                        height: 40.w,
                        width: 40.w,
                        url:
                            'http://itrace247.cssdemoco.com/storage/${widget.accountInfomationArg.userEntity?.avatar}',
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ButtonCustom(
                        params: CustomButtonParams.primary(
                          text: S.of(context).changeAvatar,
                          backgroundColor: ColorsConstant.c0A89FE,
                          width: 155.w,
                          onPressed: () {
                            getIt<AppImagePicker>()
                                .pickImage(context)
                                .then((MyFileModel? value) {
                              if (value == null) {
                                return;
                              } else {
                                setState(() {
                                  avatar = File(
                                    value.path ?? '',
                                  );
                                });
                                log('avatar:${avatar?.path}');
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    _itemAccountInfomationWidget(
                      onTap: () {
                        isShowInputInfomation.value =
                            !isShowInputInfomation.value;
                      },
                      isShowComponent: isShowInputInfomation.value,
                      title: 'Họ tên, số điện thoại',
                      component: _componentAccountInfoWidget(),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    _itemAccountInfomationWidget(
                      onTap: () {
                        isShowInputAddress.value = !isShowInputAddress.value;
                      },
                      isShowComponent: isShowInputAddress.value,
                      title: 'Địa chỉ liên hệ',
                      component: _componentAddressWidget(),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Bấm vào hoàn thành để xác nhận đã bổ sung \nthông tin đầy đủ bạn nhé',
                        style: StylesConstant.ts14w500.copyWith(
                          color: ColorsConstant.c0A6BFE,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ButtonCustom(
                        params: CustomButtonParams.primary(
                            text: 'Hoàn thành',
                            backgroundColor: ColorsConstant.c00C753,
                            width: 155.w,
                            onPressed: () {
                              if (isShowInputInfomation.value &&
                                  isShowInputAddress.value) {
                              } else {
                                isShowInputInfomation.value = true;
                                isShowInputAddress.value = true;
                              }
                              Future.delayed(const Duration(milliseconds: 200),
                                  () {
                                keyAddress.currentState!.validate();
                                keyAccountInfomation.currentState!.validate();
                                if (keyAddress.currentState?.validate() ==
                                        true &&
                                    keyAccountInfomation.currentState
                                            ?.validate() ==
                                        true) {
                                  _accountInformationBloc.add(
                                    UpdateUserInfoEvent(
                                      name: txtFullname.text,
                                      email: txtEmail.text,
                                      phone: txtPhoneNumber.text,
                                      provinceId: idProvince.toString(),
                                      districtId: idDistrict.toString(),
                                      address: txtAddress.text,
                                      wardId: idWard.toString(),
                                      avatar: avatar,
                                    ),
                                  );
                                }
                              });

                              // showCustomDialog(
                              //   context: context,
                              //   options: CustomDialogParams.simpleAlert(
                              //     image: Image.asset(
                              //       PngAssets.imgCheckmarkStarburst,
                              //       fit: BoxFit.scaleDown,
                              //       height: 80.w,
                              //       width: 80.w,
                              //     ),
                              //     message:
                              //         '''Cảm ơn bạn đã hoàn thiện thông tin cá nhân của mình''',
                              //     negativeTitle: 'Đóng',
                              //     onPressed: () => Navigator.popUntil(
                              //       context,
                              //       (Route route) =>
                              //           route.settings.name ==
                              //           BottomNavigatorPage.routeName,
                              //     ),
                              //     // Navigator.pushNamed(
                              //     //   context,
                              //     //   BottomNavigatorPage.routeName,
                              //     // ),
                              //   ),
                              // );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _componentAccountInfoWidget() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: () {
        isCompleteInfomation.value =
            keyAccountInfomation.currentState?.validate() ?? false;
      },
      key: keyAccountInfomation,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextfieldCustom(
            title: 'Họ tên đầy đủ',
            controller: txtFullname,
            validator: (String? p0) =>
                getIt<ValidateCustom>().validatorEmpty(value: p0),
            hintText: 'Nhập họ tên',
            isObligatory: true,
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Số điện thoại cá nhân',
            controller: txtPhoneNumber,
            hintText: 'Nhập số điện thoại',
            isObligatory: true,
            validator: (String? p0) =>
                getIt<ValidateCustom>().validatorEmpty(value: p0),
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Email nếu có',
            controller: txtEmail,
            hintText: 'Nhập địa chỉ email',
          ),
        ],
      ),
    );
  }

  Widget _componentAddressWidget() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: keyAddress,
      onChanged: () {
        isCompleteAddress.value = keyAddress.currentState?.validate() ?? false;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextfieldCustom(
            title: 'Tỉnh/Thành phố',
            controller: txtcity,
            hintText: 'Chọn tỉnh,thành phố',
            isObligatory: true,
            readOnly: true,
            validator: (String? p0) =>
                getIt<ValidateCustom>().validatorEmpty(value: p0),
            onTap: () {
              log('onTap');
              showCustomBottomSheet(
                context: context,
                widget: SelectAdressBottomSheetWidget(
                  selectAddressType: SelectAddressType.province,
                  idSelected: idProvince,
                ),
              ).then((value) {
                if (value == null) {
                  return;
                } else {
                  final AddressModel data = value as AddressModel;
                  setState(() {
                    txtcity.text = data.name ?? '';
                    idProvince = data.id ?? 0;
                  });
                  log('value:${data.name}');
                }
              });
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Quận huyện',
            controller: txtDistrict,
            hintText: 'Chọn quận huyện',
            isObligatory: true,
            validator: (String? p0) =>
                getIt<ValidateCustom>().validatorEmpty(value: p0),
            readOnly: true,
            onTap: () {
              log('onTap');
              return showCustomBottomSheet(
                context: context,
                widget: SelectAdressBottomSheetWidget(
                  selectAddressType: SelectAddressType.district,
                  id: idProvince,
                  idSelected: idDistrict,
                ),
              ).then((value) {
                if (value == null) {
                  return;
                } else {
                  final AddressModel data = value as AddressModel;
                  setState(() {
                    txtDistrict.text = data.name ?? '';
                    idDistrict = data.id ?? 0;
                  });
                  log('value:${data.name}');
                }
              });
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Thị xã',
            controller: txtWard,
            isObligatory: true,
            hintText: 'Chọn thị xã',
            validator: (String? p0) =>
                getIt<ValidateCustom>().validatorEmpty(value: p0),
            readOnly: true,
            onTap: () {
              log('onTap');
              return showCustomBottomSheet(
                context: context,
                widget: SelectAdressBottomSheetWidget(
                  id: idDistrict,
                  selectAddressType: SelectAddressType.ward,
                  idSelected: idWard,
                ),
              ).then((value) {
                if (value == null) {
                  return;
                } else {
                  final AddressModel data = value as AddressModel;
                  setState(() {
                    txtWard.text = data.name ?? '';
                    idWard = data.id ?? 0;
                  });
                  log('value:${data.name}');
                }
              });
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          TextfieldCustom(
            title: 'Tên đường',
            isObligatory: true,
            controller: txtAddress,
            isMaxLine: 10,
            hintText: 'Nhập tên đường',
            validator: (String? p0) =>
                getIt<ValidateCustom>().validatorEmpty(value: p0),
          ),
        ],
      ),
    );
  }

  Widget _itemAccountInfomationWidget({
    required String title,
    required Widget component,
    required Function() onTap,
    required bool isShowComponent,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        InkWell(
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
