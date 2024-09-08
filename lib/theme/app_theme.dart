

import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffDFECDB),
    useMaterial3: false,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
      titleSmall: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.black,fontSize: 15,),
      bodyLarge :  TextStyle(color: Colors.green,fontSize: 25 ,fontWeight: FontWeight.bold),
      bodySmall: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
      displaySmall: TextStyle(color : Colors.red,fontSize: 15),

    )
      ,
  );


  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color(0xff060E1E),
      useMaterial3: false,
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),
        titleMedium: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),
        titleSmall: TextStyle(color: Colors.blue,fontSize: 25,fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(color: Colors.black,fontSize: 15,),
        bodyLarge :  TextStyle(color: Colors.green,fontSize: 25 ,fontWeight: FontWeight.bold),
        bodySmall: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
        displaySmall: TextStyle(color : Colors.red,fontSize: 15),

      )
  );
}