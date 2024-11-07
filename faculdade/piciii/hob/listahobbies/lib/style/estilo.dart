import 'package:flutter/material.dart';

class AppColors {
  // Cores principais
  static const Color azulCalmo = Color(0xFF87CEEB); // Sky Blue
  static const Color lavanda = Color(0xFFE6E6FA); // Lavender
  static const Color verdeMenta = Color(0xFF98FF98); // Mint Green
  static const Color rosaPalido = Color(0xFFFFB6C1); // Light Pink
  static const Color cinzaClaro = Color(0xFFF0F0F0); // Light Gray

  // Variações
  static const Color azulCalmoEscuro = Color(0xFF4682B4); // Darker Sky Blue
  static const Color lavandaEscuro = Color(0xFFBEBED1); // Darker Lavender
  static const Color verdeMentaEscuro = Color(0xFF66CC66); // Darker Mint Green
  static const Color rosaPalidoEscuro = Color(0xFFC71585); // Darker Light Pink
  static const Color cinzaMedio = Color(0xFFD3D3D3); // Medium Gray

  static const TextStyle titulo = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: azulCalmoEscuro,
  );

  static const TextStyle subtitulo = TextStyle(
    fontSize: 16.0,
    color: lavandaEscuro,
  );

  static const TextStyle descricao = TextStyle(
    fontSize: 14.0,
    color: azulCalmoEscuro,
  );
}

ThemeData appTheme() {
  return ThemeData(
    primaryColor: AppColors.azulCalmo,
    scaffoldBackgroundColor: AppColors.cinzaClaro,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.azulCalmoEscuro,
      titleTextStyle: AppColors.titulo,
      elevation: 0,
    ),
    cardTheme: CardTheme(
      color: AppColors.cinzaClaro,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.rosaPalidoEscuro,
  
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.verdeMenta, 
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        textStyle: TextStyle(fontSize: 16),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: AppColors.titulo,
      titleMedium: AppColors.subtitulo,
      bodyLarge: AppColors.descricao,

    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cinzaClaro,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.azulCalmoEscuro),
      ),
      labelStyle: TextStyle(color: AppColors.lavandaEscuro),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.verdeMentaEscuro,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}