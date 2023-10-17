import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily:'Montserrat',
    appBarTheme: appBarTheme() ,
  );
}

AppBarTheme appBarTheme() {
  return  const AppBarTheme(
    color: Colors.white,
    elevation:0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color:Colors.white,fontSize: 11)
  );
}