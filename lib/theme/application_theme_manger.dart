import 'package:flutter/material.dart';

class ApplicationThemeManger{
  static const Color primaryColor = Color(0xFF39A552);
  static ThemeData theme =ThemeData(
    primaryColor: primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Exo",
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium:TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFF42505C),
      ),
      bodyLarge: TextStyle(
        fontFamily: "Poppins",
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: Color(0xFF4F5A69),
      ),
      displayMedium:TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF4F5A69),
      ),
      displayLarge:TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Color(0xFF303030),
      ),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: primaryColor,
      titleTextStyle: TextStyle(
        fontFamily: "Exo",
        fontSize: 26,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        )
    )
    ),
      iconTheme: IconThemeData(
          size: 35,
          color:Colors.white,
  )




  );
}