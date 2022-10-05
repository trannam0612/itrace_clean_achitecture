import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class InformationCultivarsWidget extends StatelessWidget {
  const InformationCultivarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
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
                    Column(
                      children: [
                        Text(
                          "Cây giống Sầu Riêng KAA",
                          style: StylesConstant.ts18w500,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        customCachedNetworkImage(
                          url:
                              'http://tamvietagri.vn/wp-content/uploads/2020/05/saurieng_giong-768x1024.jpg',
                          width: 100.w,
                          height: 100.w,
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Text(
                          S.of(context).amount(90),
                          style: StylesConstant.ts16w600
                              .copyWith(color: ColorsConstant.c0A89FE),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SvgPicture.asset(SvgAssets.icInfo),
                            SizedBox(
                              width: 8.w,
                            ),
                            Flexible(
                              child: Text(
                                S.of(context).characteristics,
                                style: StylesConstant.ts16w400
                                    .copyWith(color: ColorsConstant.c04142C),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          '''Sản xuất theo phương pháp ghép  cành.

Nguyên liệu lấy từ  vườn cây đầu dòng. Sản xuất theo quy trình nghiêm ngặt, đảm bảo giống có khả năng kháng bệnh cao.

Cự ly trồng: 7m x 7m

Tỉ lệ trồng đều: ≥95%

Năng suất: 25-30 tấn/năm''',
                          style: StylesConstant.ts16w600
                              .copyWith(color: ColorsConstant.c04142C),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
