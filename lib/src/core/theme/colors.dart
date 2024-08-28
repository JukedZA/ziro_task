import 'package:flutter/material.dart';

class AppColors {
  static const Color darkBackground = Color(0xFF000000);
  static const Color darkAppbar = Color(0xFF1f1f1f);

  static const Color darkContainerOnBackground = Color(0xFF1f1f1f);

  static const Color lightBackground = Color(0xFFffffff);
  static const Color lightAppbar = Color(0xFFececec);
  static const Color lightContainerOnBackground = Color(0xFFececec);
}

class AccentColors {
  static const Color purple = Color(0xFF9261f4);
  static const Color teal = Color(0xFF3ef9d9);

  static const Color red = Color(0xFFF45D64);
}

class TextColors {
  // PRIMARY COLORS
  static const Color primaryLight = Color(0xFF000000);
  static const Color primaryDark = Color(0xFFffffff);

  // SECONDARY COLORS
  static const Color secondaryLight = Color(0xFF000000);
  static const Color secondaryDark = Color(0xFFffffff);
}

class ThemeColors {
  static Color background = AppColors.darkBackground;
  static Color navBar = AppColors.darkAppbar;

  static Color containerOnBackground = AppColors.darkContainerOnBackground;

  static Color primaryText = TextColors.primaryDark;
  static Color secondaryText = TextColors.secondaryDark;

  static Color primaryIcon = TextColors.primaryDark;
  static Color secondaryIcon = TextColors.secondaryDark;

  static void setTheme({required bool isDarkMode}) {
    if (isDarkMode) {
      background = AppColors.darkBackground;
      navBar = AppColors.darkAppbar;

      containerOnBackground = AppColors.darkContainerOnBackground;

      primaryText = TextColors.primaryDark;
      secondaryText = TextColors.secondaryDark;

      primaryIcon = TextColors.primaryDark;
      secondaryIcon = TextColors.secondaryDark;
    } else {
      background = AppColors.lightBackground;
      navBar = AppColors.lightAppbar;

      containerOnBackground = AppColors.lightContainerOnBackground;

      primaryText = TextColors.primaryLight;
      secondaryText = TextColors.secondaryLight;

      primaryIcon = TextColors.primaryLight;
      secondaryIcon = TextColors.secondaryLight;
    }
  }
}
