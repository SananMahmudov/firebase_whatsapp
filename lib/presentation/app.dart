import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/login/login_cubit.dart';
import '../utils/configs.dart';
import '../utils/constants/app_themes.dart';
import '../utils/helpers/app_navigator.dart';
import 'pages/login/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Configs.appName,
      theme: AppThemes.appTheme,
      debugShowCheckedModeBanner: false,
      navigatorKey: AppNavigator.instance.navigatorKey,
      home: BlocProvider(
        lazy: false,
        create: (context) => LoginCubit()..getCountries(),
        child: const LoginPage(),
      ),
      // home: BlocProvider(
      //   create: (context) => HomeCubit(),
      //   child: const HomePage(),
      // ),
    );
  }
}
