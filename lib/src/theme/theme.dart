import 'package:flutter/material.dart';
import 'theme_constants.dart';
import 'ollie_theme_data.dart';

/// OllieTheme provides light and dark ThemeData for the app
/// while preserving the custom styling of Ollie UI components
class OllieTheme {
  // Prevent instantiation
  OllieTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color scheme
      colorScheme: ColorScheme.light(
        primary: OllieThemeConstants.lightPrimary,
        secondary: OllieThemeConstants.lightSecondary,
        error: OllieThemeConstants.lightDanger,
        surface: OllieThemeConstants.lightSurface,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: OllieThemeConstants.lightTextPrimary,
        onError: Colors.white,
      ),

      // Scaffold
      scaffoldBackgroundColor: OllieThemeConstants.lightBackground,

      // App bar
      appBarTheme: AppBarTheme(
        backgroundColor: OllieThemeConstants.lightSurface,
        foregroundColor: OllieThemeConstants.lightTextPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: OllieThemeConstants.lightTextPrimary,
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        color: OllieThemeConstants.lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          side: const BorderSide(
            color: OllieThemeConstants.lightBorder,
            width: 1,
          ),
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: OllieThemeConstants.lightBorder,
        thickness: 1,
        space: 1,
      ),

      // Icon
      iconTheme: const IconThemeData(
        color: OllieThemeConstants.lightTextSecondary,
        size: 24,
      ),

      // Text theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: OllieThemeConstants.lightTextPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: OllieThemeConstants.lightTextPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeXLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: OllieThemeConstants.lightTextPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: OllieThemeConstants.lightTextPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: OllieThemeConstants.lightTextPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: OllieThemeConstants.lightTextPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: OllieThemeConstants.lightTextPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: OllieThemeConstants.lightTextSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: OllieThemeConstants.lightTextPrimary,
        ),
      ),

      // Input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: OllieThemeConstants.lightSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: const BorderSide(
            color: OllieThemeConstants.lightBorder,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: const BorderSide(
            color: OllieThemeConstants.lightBorder,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: const BorderSide(
            color: OllieThemeConstants.lightBorderFocus,
            width: 2,
          ),
        ),
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: ColorScheme.dark(
        primary: OllieThemeConstants.darkPrimary,
        secondary: OllieThemeConstants.darkSecondary,
        error: OllieThemeConstants.darkDanger,
        surface: OllieThemeConstants.darkSurface,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: OllieThemeConstants.darkTextPrimary,
        surfaceContainerHighest:
            OllieThemeConstants.darkSurfaceContainerHighest,
        surfaceContainerHigh: OllieThemeConstants.darkSurfaceContainerHigh,
        surfaceContainer: OllieThemeConstants.darkSurfaceContainer,
        surfaceContainerLow: OllieThemeConstants.darkSurfaceContainerLow,
        surfaceContainerLowest: OllieThemeConstants.darkSurfaceContainerLowest,
        onError: Colors.black,
      ),

      dividerColor: OllieThemeConstants.darkDivider,

      // Scaffold
      scaffoldBackgroundColor: OllieThemeConstants.darkBackground,

      // App bar
      appBarTheme: AppBarTheme(
        backgroundColor: OllieThemeConstants.darkSurface,
        foregroundColor: OllieThemeConstants.darkTextPrimary,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: OllieThemeConstants.darkTextPrimary,
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        color: OllieThemeConstants.darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          side: const BorderSide(
            color: OllieThemeConstants.darkBorder,
            width: 1,
          ),
        ),
      ),

      // Divider
      dividerTheme: const DividerThemeData(
        color: OllieThemeConstants.darkBorder,
        thickness: 1,
        space: 1,
      ),

      // Icon
      iconTheme: const IconThemeData(
        color: OllieThemeConstants.darkTextSecondary,
        size: 24,
      ),

      // Text theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: OllieThemeConstants.darkTextPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: OllieThemeConstants.darkTextPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeXLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: OllieThemeConstants.darkTextPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: OllieThemeConstants.darkTextPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: OllieThemeConstants.darkTextPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: OllieThemeConstants.darkTextPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: OllieThemeConstants.darkTextPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: OllieThemeConstants.darkTextSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: OllieThemeConstants.darkTextPrimary,
        ),
      ),

      listTileTheme: ListTileThemeData(
        tileColor: OllieThemeConstants.darkSurfaceVariant,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
        ),
        iconColor: OllieThemeConstants.darkTextPrimary,
        textColor: OllieThemeConstants.darkTextPrimary,
      ),
      // Input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: OllieThemeConstants.darkSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: const BorderSide(
            color: OllieThemeConstants.darkBorder,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: const BorderSide(
            color: OllieThemeConstants.darkBorder,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: const BorderSide(
            color: OllieThemeConstants.darkBorderFocus,
            width: 2,
          ),
        ),
      ),
    );
  }

  /// Creates a light theme from custom OllieThemeData
  static ThemeData lightThemeFrom(OllieThemeData themeData) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // Color scheme
      colorScheme: ColorScheme.light(
        primary: themeData.primaryColor,
        secondary: themeData.secondaryColor,
        error: themeData.dangerColor,
        surface: themeData.surfaceColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: themeData.textPrimaryColor,
        onError: Colors.white,
      ),

      // Scaffold
      scaffoldBackgroundColor: themeData.backgroundColor,

      // App bar
      appBarTheme: AppBarTheme(
        backgroundColor: themeData.surfaceColor,
        foregroundColor: themeData.textPrimaryColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: themeData.textPrimaryColor,
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        color: themeData.surfaceColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          side: BorderSide(
            color: themeData.borderColor,
            width: 1,
          ),
        ),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: themeData.borderColor,
        thickness: 1,
        space: 1,
      ),

      // Icon
      iconTheme: IconThemeData(
        color: themeData.textSecondaryColor,
        size: 24,
      ),

      // Text theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: themeData.textPrimaryColor,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: themeData.textPrimaryColor,
        ),
        displaySmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeXLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: themeData.textPrimaryColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: themeData.textPrimaryColor,
        ),
        headlineSmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: themeData.textPrimaryColor,
        ),
        titleLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: themeData.textPrimaryColor,
        ),
        bodyLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: themeData.textPrimaryColor,
        ),
        bodyMedium: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: themeData.textSecondaryColor,
        ),
        labelLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: themeData.textPrimaryColor,
        ),
      ),

      // Input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: themeData.surfaceVariantColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: BorderSide(
            color: themeData.borderColor,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: BorderSide(
            color: themeData.borderColor,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: BorderSide(
            color: themeData.borderFocusColor,
            width: 2,
          ),
        ),
      ),
    );
  }

  /// Creates a dark theme from custom OllieThemeData
  static ThemeData darkThemeFrom(OllieThemeData themeData) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // Color scheme
      colorScheme: ColorScheme.dark(
        primary: themeData.primaryColorDark,
        secondary: themeData.secondaryColorDark,
        error: themeData.dangerColorDark,
        surface: themeData.surfaceColorDark,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: themeData.textPrimaryColorDark,
        surfaceContainerHighest: OllieThemeConstants.darkSurfaceContainerHighest,
        surfaceContainerHigh: OllieThemeConstants.darkSurfaceContainerHigh,
        surfaceContainer: OllieThemeConstants.darkSurfaceContainer,
        surfaceContainerLow: OllieThemeConstants.darkSurfaceContainerLow,
        surfaceContainerLowest: OllieThemeConstants.darkSurfaceContainerLowest,
        onError: Colors.black,
      ),

      dividerColor: OllieThemeConstants.darkDivider,

      // Scaffold
      scaffoldBackgroundColor: themeData.backgroundColorDark,

      // App bar
      appBarTheme: AppBarTheme(
        backgroundColor: themeData.surfaceColorDark,
        foregroundColor: themeData.textPrimaryColorDark,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: themeData.textPrimaryColorDark,
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
        ),
      ),

      // Card
      cardTheme: CardThemeData(
        color: themeData.surfaceColorDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          side: BorderSide(
            color: themeData.borderColorDark,
            width: 1,
          ),
        ),
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: themeData.borderColorDark,
        thickness: 1,
        space: 1,
      ),

      // Icon
      iconTheme: IconThemeData(
        color: themeData.textSecondaryColorDark,
        size: 24,
      ),

      // Text theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: themeData.textPrimaryColorDark,
        ),
        displayMedium: TextStyle(
          fontSize: 28,
          fontWeight: OllieThemeConstants.fontWeightBold,
          color: themeData.textPrimaryColorDark,
        ),
        displaySmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeXLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: themeData.textPrimaryColorDark,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: themeData.textPrimaryColorDark,
        ),
        headlineSmall: TextStyle(
          fontSize: OllieThemeConstants.fontSizeLarge,
          fontWeight: OllieThemeConstants.fontWeightSemiBold,
          color: themeData.textPrimaryColorDark,
        ),
        titleLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: themeData.textPrimaryColorDark,
        ),
        bodyLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeBody,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: themeData.textPrimaryColorDark,
        ),
        bodyMedium: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightRegular,
          color: themeData.textSecondaryColorDark,
        ),
        labelLarge: TextStyle(
          fontSize: OllieThemeConstants.fontSizeMedium,
          fontWeight: OllieThemeConstants.fontWeightMedium,
          color: themeData.textPrimaryColorDark,
        ),
      ),

      listTileTheme: ListTileThemeData(
        tileColor: themeData.surfaceVariantColorDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
        ),
        iconColor: themeData.textPrimaryColorDark,
        textColor: themeData.textPrimaryColorDark,
      ),

      // Input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: themeData.surfaceVariantColorDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: BorderSide(
            color: themeData.borderColorDark,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: BorderSide(
            color: themeData.borderColorDark,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          borderSide: BorderSide(
            color: themeData.borderFocusColorDark,
            width: 2,
          ),
        ),
      ),
    );
  }
}
