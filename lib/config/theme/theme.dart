

import 'package:cat_breeds/utils/color/custom_colors.dart';
import 'package:flutter/material.dart';


const seedColor = Color.fromARGB(255, 7, 80, 59);

class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });


  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
    fontFamily: 'Poppins',
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: CustomColors.mainColor,
      selectionColor: CustomColors.tertiaryColor,
      selectionHandleColor: CustomColors.secundaryColor,
    )
  );

}