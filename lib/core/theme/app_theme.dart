// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(

        brightness: Brightness.light,
        primary: AppColors.primary,
        onPrimary: Colors.white,
        secondary: AppColors.primarylight,
        onSecondary: Colors.white,
        error: AppColors.error,
        onError: Colors.white,
        background: AppColors.scaffoldbg,
        onBackground: Colors.white,
        surface: AppColors.scaffoldbg,
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldbg,
      primaryColor: AppColors.primary,
      fontFamily: 'Poppins',
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: _appBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      cardTheme: _cardTheme,
      inputDecorationTheme: _inputDecorationTheme,
      dividerTheme: _dividerTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomNavBarTheme,
    );
  }

  static ThemeData get darkTheme {
    // For future implementation
    return lightTheme;
  }

 

 

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
    foregroundColor: Colors.white,
    shadowColor: AppColors.white,
    surfaceTintColor: AppColors.white,
    centerTitle: true,
    elevation: 0,
    iconTheme: IconThemeData(
      color: AppColors.textcolor
    ),
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: AppColors.textcolor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  static final ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      textStyle: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      elevation: 2,
    ),
  );

  static final CardThemeData _cardTheme = CardThemeData(

    color: AppColors.white,
    margin: const EdgeInsets.all(8),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    elevation: 2,
    shadowColor: AppColors.white,
  );

  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    fillColor: AppColors.white,
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.error),
    ),
    labelStyle: TextStyle(color: Colors.white),
    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
    contentPadding: const EdgeInsets.all(16),
  );

  static final DividerThemeData _dividerTheme = DividerThemeData(
    color: Colors.white.withOpacity(0.2),
    thickness: 1,
    space: 24,
  );

  static final TabBarThemeData _tabBarTheme = TabBarThemeData(
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white.withOpacity(0.6),
    indicator: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: AppColors.primary,
          width: 3,
        ),
      ),
    ),
    labelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
  );

  static final BottomNavigationBarThemeData _bottomNavBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.textcolor,
    selectedLabelStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 8
  );
} 