import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/theme/app_theme.dart';
import 'package:todo/ui/create_acc/create_acc_screen.dart';
import 'package:todo/ui/layout/layout_screen.dart';
import 'package:todo/ui/login/login_screen.dart';
import 'package:todo/ui/splash/splash_screen.dart';
import 'package:todo/ui/tasks/edit_task_screen.dart';

import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(EasyLocalization(
      path: "assets/translations",
     supportedLocales: [
       Locale("en"),
       Locale("ar")
     ],
      saveLocale: true,
      startLocale: Locale("en"),

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: AppTheme.lightTheme ,
      initialRoute: SplashScreen.routeName,
      routes:{
        SplashScreen.routeName  : (context) => SplashScreen(),
        CreateAccScreen.routeName : (context) => CreateAccScreen(),
        LoginScreen.routeName : (context) =>  LoginScreen(),
        LayoutScreen.routeName : (context) => LayoutScreen(),
        EditTaskScreen.routeName : (context) => EditTaskScreen()
      },
    );
  }
}
