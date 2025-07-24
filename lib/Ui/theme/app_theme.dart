import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFF0B1E2D),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          titleLarge: TextStyle( 
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
          bodyMedium: TextStyle( 
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white60,
          ),
          labelLarge: TextStyle( 
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      );
}
