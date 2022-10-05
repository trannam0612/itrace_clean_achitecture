import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:itrace_247/config/get_it/getit_config.dart' as get_it;
import 'package:itrace_247/config/get_it/getit_config.dart';
import 'package:itrace_247/config/routes.dart';
import 'package:itrace_247/config/utils/enum.dart';
import 'package:itrace_247/generated/l10n.dart';
import 'package:itrace_247/presentation/bloc/app_bloc.dart';
import 'package:itrace_247/presentation/screen/bottom_navigator/bottom_navigator_page.dart';
import 'package:itrace_247/presentation/screen/login/bloc/login_bloc.dart';
import 'package:itrace_247/presentation/screen/login/login_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

GlobalKey keyScaffold = GlobalKey();
GlobalKey keyBottomNavibar = GlobalKey();
GlobalKey keyMain = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await get_it.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LoginBloc loginBloc = getIt<LoginBloc>();
  @override
  void initState() {
    loginBloc.add(ValidateTokenEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => loginBloc,
        ),
        BlocProvider<AppBloc>(
          create: (context) => getIt<AppBloc>(),
        ),
      ],
      child: BlocBuilder<LoginBloc, LoginState>(
        bloc: loginBloc,
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (BuildContext context, Widget? child) => MaterialApp(
              title: 'ITrace247',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              locale: const Locale('vi'),
              localizationsDelegates: [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              onGenerateRoute: AppRouter().generateRoute,
              home: state.validateTokenState == null
                  ? const Scaffold(
                      body: Center(
                        child: CupertinoActivityIndicator(),
                      ),
                    )
                  : state.validateTokenState == LoadState.success
                      ? const BottomNavigatorPage()
                      : const LoginPage(),
            ),
          );
        },
      ),
    );
  }
}
