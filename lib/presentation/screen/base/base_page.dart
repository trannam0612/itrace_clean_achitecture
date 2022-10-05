import 'package:flutter/material.dart';
import 'package:itrace_247/config/utils/colors.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    super.key,
    required this.body,
    this.appBar,
    this.endDrawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.keyScaffold,
    this.isScroll = true,
  });

  @override
  State<BasePage> createState() => _BasePageState();
  final Widget body;
  final Widget? endDrawer;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;
  final FloatingActionButton? floatingActionButton;
  final GlobalKey<ScaffoldState>? keyScaffold;
  final bool? isScroll;
}

class _BasePageState extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: widget.keyScaffold,
        endDrawer: widget.endDrawer ?? const SizedBox(),
        backgroundColor: ColorsConstant.cWhite,
        appBar: widget.appBar,
        body: SingleChildScrollView(
          physics: widget.isScroll == false
              ? const NeverScrollableScrollPhysics()
              : const ClampingScrollPhysics(),
          child: widget.body,
        ),
        bottomNavigationBar: widget.bottomNavigationBar,
        floatingActionButton: widget.floatingActionButton,
      ),
    );
  }
}
