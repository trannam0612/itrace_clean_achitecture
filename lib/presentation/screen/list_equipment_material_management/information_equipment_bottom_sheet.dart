import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:itrace_247/presentation/screen/utils_widget/custom_cached_network_image.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/config/utils/assets.dart';
import 'package:itrace_247/config/utils/colors.dart';
import 'package:itrace_247/config/utils/styles.dart';

class InformationEquipemntWidget extends StatelessWidget {
  const InformationEquipemntWidget({super.key});

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
                          "Bình xịt 3 lít",
                          style: StylesConstant.ts18w500,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        customCachedNetworkImage(
                          url:
                              'https://check.net.vn/Data/product/mainimages/original/product3253.jpg',
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
                          '''Actimax 50WG là thuốc trừ sâu sinh học
thế hệ mới với hoạt chất Emamectin benzoate
trích ly trong quá trình lên men nấm Streptomyces avermitilis. 

Hoạt chất Emamectin benzoate tấn công cơ chế dẫn truyền xung động thần kinh làm cho sâu hại
bị tê liệt và chết.

Sau khi phun Actimax 50WG sẽ thấm vào bên trong mô lá, khi sâu hại chích hút hay ăn phải thuốc sẽ ngừng ăn, tê liệt và chết sau
2 – 4 ngày.''',
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
