import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/manger/provider.dart';
import 'package:todo/manger/theme_provider.dart';
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

      child: ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          child: const MyApp())));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  late ThemeProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ThemeProvider>(context);
    provider.getTheme();
    return Consumer<ThemeProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'Todo',
          theme: provider.selectedTheme,
          initialRoute: SplashScreen.routeName,
          routes:{
            SplashScreen.routeName  : (context) => SplashScreen(),
            CreateAccScreen.routeName : (context) => CreateAccScreen(),
            LoginScreen.routeName : (context) =>  LoginScreen(),
            LayoutScreen.routeName : (context) => LayoutScreen(),
            EditTaskScreen.routeName : (context) => EditTaskScreen()
          },
        );
      } ,
    );
  }
}
