import 'package:flutter/material.dart';
import 'theme_constants.dart';
import 'ollie_theme_data.dart';
import 'ollie_theme_provider.dart';

/// Extension on BuildContext to easily access theme-aware colors
extension ThemeExtension on BuildContext {
  /// Get current brightness
  Brightness get brightness => Theme.of(this).brightness;

  /// Check if dark mode is active
  bool get isDarkMode => brightness == Brightness.dark;

  /// Get the OllieThemeData if available
  OllieThemeData? get _themeData => OllieThemeProvider.maybeOf(this);

  /// Get primary color (checks OllieThemeProvider first)
  Color get primaryColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getPrimary(brightness);
    }
    return OllieThemeConstants.getPrimaryColor(brightness);
  }

  /// Get text color (checks OllieThemeProvider first)
  Color get textColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getTextPrimary(brightness);
    }
    return OllieThemeConstants.getTextColor(brightness);
  }

  /// Get secondary text color (checks OllieThemeProvider first)
  Color get secondaryTextColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getTextSecondary(brightness);
    }
    return OllieThemeConstants.getSecondaryTextColor(brightness);
  }

  /// Get background color (checks OllieThemeProvider first)
  Color get backgroundColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getBackground(brightness);
    }
    return OllieThemeConstants.getBackgroundColor(brightness);
  }

  /// Get surface color (checks OllieThemeProvider first)
  Color get surfaceColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getSurface(brightness);
    }
    return OllieThemeConstants.getSurfaceColor(brightness);
  }

  /// Get surface variant color (checks OllieThemeProvider first)
  Color get surfaceVariantColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getSurfaceVariant(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkBackground
        : OllieThemeConstants.lightSurfaceVariant;
  }

  /// Get border color (checks OllieThemeProvider first)
  Color get borderColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getBorder(brightness);
    }
    return OllieThemeConstants.getBorderColor(brightness);
  }

  /// Get hover color (checks OllieThemeProvider first)
  Color get hoverColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getHover(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkHover
        : OllieThemeConstants.lightHover;
  }

  /// Get pressed color (checks OllieThemeProvider first)
  Color get pressedColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getPressed(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkPressed
        : OllieThemeConstants.lightPressed;
  }

  /// Get disabled color (checks OllieThemeProvider first)
  Color get disabledColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getDisabled(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkDisabled
        : OllieThemeConstants.lightDisabled;
  }

  /// Get text disabled color (checks OllieThemeProvider first)
  Color get textDisabledColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getTextDisabled(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkTextDisabled
        : OllieThemeConstants.lightTextDisabled;
  }

  /// Get danger color (checks OllieThemeProvider first)
  Color get dangerColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getDanger(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkDanger
        : OllieThemeConstants.lightDanger;
  }

  /// Get success color (checks OllieThemeProvider first)
  Color get successColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getSuccess(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkSuccess
        : OllieThemeConstants.lightSuccess;
  }

  /// Get warning color (checks OllieThemeProvider first)
  Color get warningColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getWarning(brightness);
    }
    return isDarkMode
        ? const Color(0xFFFFB74D)
        : const Color(0xFFF57C00);
  }

  /// Get info color (checks OllieThemeProvider first)
  Color get infoColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getInfo(brightness);
    }
    return primaryColor;
  }

  /// Get secondary color (checks OllieThemeProvider first)
  Color get secondaryColor {
    final themeData = _themeData;
    if (themeData != null) {
      return themeData.getSecondary(brightness);
    }
    return isDarkMode
        ? OllieThemeConstants.darkSecondary
        : OllieThemeConstants.lightSecondary;
  }

  /// Get shadow
  List<BoxShadow> getShadow({bool medium = false}) {
    return OllieThemeConstants.getShadow(brightness, medium: medium);
  }

  /// Get small shadow
  List<BoxShadow> get shadowSmall => OllieThemeConstants.getShadow(brightness);

  /// Get medium shadow
  List<BoxShadow> get shadowMedium =>
      OllieThemeConstants.getShadow(brightness, medium: true);
}

/// Helper to get theme-aware colors without BuildContext
class ThemeColors {
  final Brightness brightness;

  const ThemeColors(this.brightness);

  factory ThemeColors.light() => const ThemeColors(Brightness.light);
  factory ThemeColors.dark() => const ThemeColors(Brightness.dark);

  Color get primary => OllieThemeConstants.getPrimaryColor(brightness);
  Color get text => OllieThemeConstants.getTextColor(brightness);
  Color get secondaryText =>
      OllieThemeConstants.getSecondaryTextColor(brightness);
  Color get background => OllieThemeConstants.getBackgroundColor(brightness);
  Color get surface => OllieThemeConstants.getSurfaceColor(brightness);
  Color get border => OllieThemeConstants.getBorderColor(brightness);

  Color get surfaceVariant => brightness == Brightness.dark
      ? OllieThemeConstants.darkSurfaceVariant
      : OllieThemeConstants.lightSurfaceVariant;

  Color get danger => brightness == Brightness.dark
      ? OllieThemeConstants.darkDanger
      : OllieThemeConstants.lightDanger;

  Color get success => brightness == Brightness.dark
      ? OllieThemeConstants.darkSuccess
      : OllieThemeConstants.lightSuccess;

  Color get warning => brightness == Brightness.dark
      ? const Color(0xFFFFB74D)
      : const Color(0xFFF57C00);

  Color get info => primary;
}
