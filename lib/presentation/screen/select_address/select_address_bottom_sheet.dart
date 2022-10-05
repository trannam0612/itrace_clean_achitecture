import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/domain/entities/address/district_entity.dart';
import 'package:itrace_247/domain/entities/address/province_entity.dart';
import 'package:itrace_247/domain/entities/address/ward_entity.dart';
import 'package:itrace_247/presentation/screen/select_address/address_model.dart';
import 'package:itrace_247/presentation/screen/select_address/bloc/address_bloc.dart';
import 'package:itrace_247/presentation/screen/utils_widget/textfield_custom.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class SelectAdressBottomSheetWidget extends StatefulWidget {
  const SelectAdressBottomSheetWidget({
    super.key,
    this.selectAddressType,
    this.id,
    this.idSelected,
  });
  final SelectAddressType? selectAddressType;
  final int? id;
  final int? idSelected;

  @override
  State<SelectAdressBottomSheetWidget> createState() =>
      _SelectAdressBottomSheetWidgetState();
}

class _SelectAdressBottomSheetWidgetState
    extends State<SelectAdressBottomSheetWidget> {
  ValueNotifier<int?> isSelected = ValueNotifier<int?>(null);

  final AddressBloc _addressBloc = getIt();
  @override
  void initState() {
    if (widget.selectAddressType == SelectAddressType.province) {
      _addressBloc.add(GetListProvincesEvent());
    } else if (widget.selectAddressType == SelectAddressType.district) {
      _addressBloc.add(GetListDistrictsEvent(widget.id.toString()));
    } else {
      _addressBloc.add(GetListWardsEvent(widget.id.toString()));
    }
    log('id:${widget.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.61,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.w),
          topRight: Radius.circular(16.w),
        ),
      ),
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return BlocProvider<AddressBloc>(
            create: (BuildContext context) => _addressBloc,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(SvgAssets.icCancel),
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextfieldCustom(
                  controller: TextEditingController(),
                  isCircular: true,
                  hintText: 'Tìm kiếm',
                  prefixIcon: SvgPicture.asset(
                    SvgAssets.icSearch,
                    fit: BoxFit.scaleDown,
                  ),
                  colorHint: ColorsConstant.cBlack,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Expanded(
                  child: Scrollbar(
                    child: BlocBuilder<AddressBloc, AddressState>(
                      builder: (BuildContext context, AddressState state) {
                        List<AddressModel> listData = <AddressModel>[];

                        if (widget.selectAddressType ==
                            SelectAddressType.province) {
                          for (ProvinceEntity element
                              in state.listProvinces ?? <ProvinceEntity>[]) {
                            listData.add(
                              AddressModel(
                                id: element.id,
                                name: element.name,
                              ),
                            );
                          }
                        } else if (widget.selectAddressType ==
                            SelectAddressType.district) {
                          for (DistrictEntity element
                              in state.listDistricts ?? <DistrictEntity>[]) {
                            listData.add(
                              AddressModel(
                                id: element.id,
                                name: element.name,
                              ),
                            );
                          }
                        } else {
                          for (WardEntity element
                              in state.listWards ?? <WardEntity>[]) {
                            listData.add(
                              AddressModel(
                                id: element.id,
                                name: element.name,
                              ),
                            );
                          }
                        }

                        if (state.getListProvincesState == LoadState.loading) {
                          return const Center(
                            child: CupertinoActivityIndicator(),
                          );
                        } else {
                          log('element.id == ${widget.id}');
                          for (var element in listData) {
                            if (element.id == widget.idSelected) {
                              log('element.id == widget.id:${element.id == widget.id}');
                              element.selected = true;
                            }
                          }
                          return ListView.separated(
                            itemCount: listData.length,
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(
                              height: 16.h,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                ValueListenableBuilder<int?>(
                              valueListenable: isSelected,
                              builder: (
                                BuildContext context,
                                int? valueSelected,
                                Widget? child,
                              ) =>
                                  InkWell(
                                onTap: () {
                                  setState(() {
                                    if (!listData[index].selected!) {
                                      for (AddressModel element in listData) {
                                        element.selected = false;
                                      }
                                      listData[index].selected = true;
                                    } else {
                                      listData[index].selected = false;
                                    }
                                  });
                                  Navigator.pop(context, listData[index]);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 10.w,
                                  ),
                                  child: IntrinsicHeight(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 6.h,
                                          ),
                                          child: Text(
                                            listData[index].name ?? '',
                                            style: StylesConstant.ts18w500
                                                .copyWith(
                                              color: ColorsConstant.c04142C,
                                            ),
                                          ),
                                        ),
                                        if (listData[index].selected == true)
                                          SvgPicture.asset(
                                            SvgAssets.icCheckmarkCircle,
                                            fit: BoxFit.fill,
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _itemTitleWidget({
    required String icon,
    required String title,
    String? value,
    required String unit,
  }) {
    return Row(
      children: <Widget>[
        SvgPicture.asset(icon),
        SizedBox(
          width: 8.w,
        ),
        Text(
          title,
          style:
              StylesConstant.ts16w400.copyWith(color: ColorsConstant.c04142C),
        ),
        const Spacer(),
        Text(
          '${value ?? ''} $unit',
          style:
              StylesConstant.ts18w500.copyWith(color: ColorsConstant.c04142C),
        ),
      ],
    );
  }
}
