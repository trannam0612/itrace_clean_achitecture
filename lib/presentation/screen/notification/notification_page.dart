import 'package:flutter/cupertino.dart';
import 'package:itrace_247/presentation/screen/base/base_page.dart';
import 'package:itrace_247/presentation/screen/utils_widget/appbar_widget.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  static const String routeName = '/NotificationPage';

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBar: appBarShared(
        'Notification',
        context: context,
      ),
      body: const Center(
        child: Text('Notification Page'),
      ),
    );
  }
}
