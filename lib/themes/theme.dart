import 'package:design/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData light({Color color = const Color(0xFF63BF76)}) => ThemeData(
      useMaterial3: true,
      fontFamily: 'poppins',
      primaryColor: color,
      secondaryHeaderColor: const Color(0xFF1ED7AA),
      disabledColor: const Color(0xFFBABFC4),
      scaffoldBackgroundColor: ColorsOfApp.appScaffoldColor,
      brightness: Brightness.light,
      hintColor: const Color(0xFF9F9F9F),
      cardColor: const Color(0xFFF7F8FB), // 0xFFF6F6F6
      dividerColor: Colors.grey[300]!, //0xFFE8E8E8
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: color),
      ),
      colorScheme: ColorScheme.light(primary: color, secondary: color).copyWith(
          background: const Color(0xFFFFFFFF),
          error: const Color(0xFFdd3135),
          outline: const Color(0xFFF4F4F4)),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w600, fontFamily: 'poppins'),
        bodyMedium: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, fontFamily: 'poppins'),
        bodySmall: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: 'poppins',
        ),
      ),
      appBarTheme: const AppBarTheme(
        toolbarHeight: 50,
        elevation: 0,
        titleSpacing: 20,
        shadowColor: ColorsOfApp.appScaffoldColor,
        color: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Color(0xFF9F9F9F)),
        titleTextStyle: TextStyle(
            color: Color(0xFF000000),
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'poppins'),
      ),
    );
