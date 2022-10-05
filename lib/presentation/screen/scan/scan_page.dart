import 'package:flutter/cupertino.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});
  static const String routeName = '/ScanPage';

  @override
  State<ScanPage> createState() => ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar:
          appBarShared(context: context, 'Truy xuất', isShowBackButton: false),
      body: const Center(
        child: Text('ScanPage'),
      ),
    );
  }
}
