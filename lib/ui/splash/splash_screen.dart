import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/service/firebase_functions.dart';
import 'package:todo/ui/create_acc/create_acc_screen.dart';
import 'package:todo/ui/layout/layout_screen.dart';
import 'package:todo/ui/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
 static const String routeName = "/";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),() {
      if(FirebaseAuth.instance.currentUser != null){
        Navigator.pushNamedAndRemoveUntil(context, LayoutScreen.routeName,(route) => false,);
      }
      else{
        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName,(route) => false,);
      }

    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDFECDB),
      body: Center(
         child: Image(image: AssetImage("assets/logo/logo.png")),
      ),
    );
  }
}
