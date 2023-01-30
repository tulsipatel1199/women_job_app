import 'package:flutter/material.dart';

class AppThemes{
  static const Color primaryColor = Color(0xffF2357D);
  static const Color ButtonColor = Colors.black;
  static const Color White = Colors.white;

  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Color(0xffFFF3E8),
    primaryColor: Color(0xffF2357D),

    appBarTheme: AppBarTheme(color: primaryColor, elevation: 0.9),
    cardTheme: CardTheme(color:White, shape: RoundedRectangleBorder(
      side: BorderSide(width: 1,color: Color(0xffB9B9B9), style: BorderStyle.solid ),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ) ) ,
    floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primaryColor),
    elevatedButtonTheme:  ElevatedButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ButtonColor))),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: primaryColor,
    )
    //primarySwatch: Color.
  );

  static final TextTheme textTheme = TextTheme(


  );

}