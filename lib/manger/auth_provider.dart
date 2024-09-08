import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/service/firebase_functions.dart';
import 'package:todo/ui/layout/layout_screen.dart';
import 'package:todo/ui/login/login_screen.dart';

class AuthProvider extends ChangeNotifier{
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSecure = true;

   void changeSecure(){
    isSecure = !isSecure;
    notifyListeners();
  }

  void createAccount(BuildContext context)async{
    UserCredential credential = await FirebaseFunctions.createAccount(emailController.text, passwordController.text,nameController.text,phoneController.text);
     if(credential != null){
       Navigator.pushNamedAndRemoveUntil(context, LayoutScreen.routeName, (route) => false);
     }
  }

  void loginAccount(BuildContext context)async{
    UserCredential credential = await FirebaseFunctions.loginAccount(emailController.text, passwordController.text);
    if(credential != null){
      Navigator.pushNamedAndRemoveUntil(context, LayoutScreen.routeName, (route) => false);
    }
  }

}