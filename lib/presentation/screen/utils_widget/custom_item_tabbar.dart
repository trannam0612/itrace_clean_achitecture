import 'package:flutter/material.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class CustomItemTabbar extends StatelessWidget {
  const CustomItemTabbar({
    super.key,
    required this.title,
    this.indexItem,
    required this.selected,
    this.isMultipleItem = false,
  });
  final String title;
  final int? indexItem;
  final bool selected;
  final bool isMultipleItem;

  @override
  Widget build(BuildContext context) {
    Radius radius8 = const Radius.circular(8);
    Radius radius0 = const Radius.circular(0);
    return Container(
      decoration: BoxDecoration(
        color: !selected ? ColorsConstant.c0A89FE : Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: indexItem == 0 ? radius8 : radius0,
          bottomLeft: indexItem == 0 ? radius8 : radius0,
          topRight: (isMultipleItem && indexItem == 2) ||
                  (!isMultipleItem && indexItem == 1)
              ? radius8
              : radius0,
          bottomRight: (isMultipleItem && indexItem == 2) ||
                  (!isMultipleItem && indexItem == 1)
              ? radius8
              : radius0,
        ),
      ),
      child: Container(
        // margin: EdgeInsets.only(
        //   left: tabController.index == 0 ? 1 : 0,
        //   right: tabController.index == 2 ? 1 : 0,
        // ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: indexItem == 0 ? radius8 : radius0,
            bottomLeft: indexItem == 0 ? radius8 : radius0,
            topRight: (isMultipleItem && indexItem == 2) ||
                    (!isMultipleItem && indexItem == 1)
                ? radius8
                : radius0,
            bottomRight: (isMultipleItem && indexItem == 2) ||
                    (!isMultipleItem && indexItem == 1)
                ? radius8
                : radius0,
          ),
          color: selected ? ColorsConstant.c0A89FE : ColorsConstant.cD3EAFF,
        ),
        child: Tab(
          icon: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: StylesConstant.ts16w500.copyWith(
              color: selected ? ColorsConstant.cWhite : ColorsConstant.c0A89FE,
            ),
          ),
        ),
      ),
    );
  }
}
