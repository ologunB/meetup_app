import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData get lightTheme => ThemeData(
      colorScheme: const ColorScheme.light(primary: AppColors.primary),
      textTheme: const TextTheme(),
      primaryColor: AppColors.primary,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

ThemeData get appTheme => lightTheme;
