import 'package:flutter/cupertino.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});
  static const String routeName = '/DiaryPage';

  @override
  State<DiaryPage> createState() => DiaryPageState();
}

class DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar:
          appBarShared(context: context, 'Nhật ký', isShowBackButton: false),
      body: const Center(
        child: Text('ScanPage'),
      ),
    );
  }
}
