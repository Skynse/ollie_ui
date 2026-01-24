import 'package:flutter/material.dart';
import 'theme_constants.dart';

/// Data class containing all customizable theme colors for Ollie UI.
///
/// This class holds color values for both light and dark themes,
/// allowing users to customize the appearance of Ollie UI components.
class OllieThemeData {
  // Primary colors
  final Color primaryColor;
  final Color primaryColorDark;

  // Secondary colors
  final Color secondaryColor;
  final Color secondaryColorDark;

  // Semantic colors
  final Color dangerColor;
  final Color dangerColorDark;
  final Color successColor;
  final Color successColorDark;
  final Color warningColor;
  final Color warningColorDark;
  final Color infoColor;
  final Color infoColorDark;

  // Background colors
  final Color backgroundColor;
  final Color backgroundColorDark;
  final Color surfaceColor;
  final Color surfaceColorDark;
  final Color surfaceVariantColor;
  final Color surfaceVariantColorDark;

  // Text colors
  final Color textPrimaryColor;
  final Color textPrimaryColorDark;
  final Color textSecondaryColor;
  final Color textSecondaryColorDark;
  final Color textDisabledColor;
  final Color textDisabledColorDark;

  // Border colors
  final Color borderColor;
  final Color borderColorDark;
  final Color borderFocusColor;
  final Color borderFocusColorDark;

  // State colors
  final Color hoverColor;
  final Color hoverColorDark;
  final Color pressedColor;
  final Color pressedColorDark;
  final Color disabledColor;
  final Color disabledColorDark;

  const OllieThemeData({
    // Primary - defaults to blue
    this.primaryColor = OllieThemeConstants.lightPrimary,
    this.primaryColorDark = OllieThemeConstants.darkPrimary,

    // Secondary
    this.secondaryColor = OllieThemeConstants.lightSecondary,
    this.secondaryColorDark = OllieThemeConstants.darkSecondary,

    // Danger
    this.dangerColor = OllieThemeConstants.lightDanger,
    this.dangerColorDark = OllieThemeConstants.darkDanger,

    // Success
    this.successColor = OllieThemeConstants.lightSuccess,
    this.successColorDark = OllieThemeConstants.darkSuccess,

    // Warning - defaults to orange
    this.warningColor = const Color(0xFFF57C00),
    this.warningColorDark = const Color(0xFFFFB74D),

    // Info - defaults to blue (same as primary)
    this.infoColor = OllieThemeConstants.lightPrimary,
    this.infoColorDark = OllieThemeConstants.darkPrimary,

    // Backgrounds
    this.backgroundColor = OllieThemeConstants.lightBackground,
    this.backgroundColorDark = OllieThemeConstants.darkBackground,
    this.surfaceColor = OllieThemeConstants.lightSurface,
    this.surfaceColorDark = OllieThemeConstants.darkSurface,
    this.surfaceVariantColor = OllieThemeConstants.lightSurfaceVariant,
    this.surfaceVariantColorDark = OllieThemeConstants.darkSurfaceVariant,

    // Text
    this.textPrimaryColor = OllieThemeConstants.lightTextPrimary,
    this.textPrimaryColorDark = OllieThemeConstants.darkTextPrimary,
    this.textSecondaryColor = OllieThemeConstants.lightTextSecondary,
    this.textSecondaryColorDark = OllieThemeConstants.darkTextSecondary,
    this.textDisabledColor = OllieThemeConstants.lightTextDisabled,
    this.textDisabledColorDark = OllieThemeConstants.darkTextDisabled,

    // Borders
    this.borderColor = OllieThemeConstants.lightBorder,
    this.borderColorDark = OllieThemeConstants.darkBorder,
    this.borderFocusColor = OllieThemeConstants.lightBorderFocus,
    this.borderFocusColorDark = OllieThemeConstants.darkBorderFocus,

    // States
    this.hoverColor = OllieThemeConstants.lightHover,
    this.hoverColorDark = OllieThemeConstants.darkHover,
    this.pressedColor = OllieThemeConstants.lightPressed,
    this.pressedColorDark = OllieThemeConstants.darkPressed,
    this.disabledColor = OllieThemeConstants.lightDisabled,
    this.disabledColorDark = OllieThemeConstants.darkDisabled,
  });

  /// Creates a copy of this theme data with the given fields replaced.
  OllieThemeData copyWith({
    Color? primaryColor,
    Color? primaryColorDark,
    Color? secondaryColor,
    Color? secondaryColorDark,
    Color? dangerColor,
    Color? dangerColorDark,
    Color? successColor,
    Color? successColorDark,
    Color? warningColor,
    Color? warningColorDark,
    Color? infoColor,
    Color? infoColorDark,
    Color? backgroundColor,
    Color? backgroundColorDark,
    Color? surfaceColor,
    Color? surfaceColorDark,
    Color? surfaceVariantColor,
    Color? surfaceVariantColorDark,
    Color? textPrimaryColor,
    Color? textPrimaryColorDark,
    Color? textSecondaryColor,
    Color? textSecondaryColorDark,
    Color? textDisabledColor,
    Color? textDisabledColorDark,
    Color? borderColor,
    Color? borderColorDark,
    Color? borderFocusColor,
    Color? borderFocusColorDark,
    Color? hoverColor,
    Color? hoverColorDark,
    Color? pressedColor,
    Color? pressedColorDark,
    Color? disabledColor,
    Color? disabledColorDark,
  }) {
    return OllieThemeData(
      primaryColor: primaryColor ?? this.primaryColor,
      primaryColorDark: primaryColorDark ?? this.primaryColorDark,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      secondaryColorDark: secondaryColorDark ?? this.secondaryColorDark,
      dangerColor: dangerColor ?? this.dangerColor,
      dangerColorDark: dangerColorDark ?? this.dangerColorDark,
      successColor: successColor ?? this.successColor,
      successColorDark: successColorDark ?? this.successColorDark,
      warningColor: warningColor ?? this.warningColor,
      warningColorDark: warningColorDark ?? this.warningColorDark,
      infoColor: infoColor ?? this.infoColor,
      infoColorDark: infoColorDark ?? this.infoColorDark,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundColorDark: backgroundColorDark ?? this.backgroundColorDark,
      surfaceColor: surfaceColor ?? this.surfaceColor,
      surfaceColorDark: surfaceColorDark ?? this.surfaceColorDark,
      surfaceVariantColor: surfaceVariantColor ?? this.surfaceVariantColor,
      surfaceVariantColorDark: surfaceVariantColorDark ?? this.surfaceVariantColorDark,
      textPrimaryColor: textPrimaryColor ?? this.textPrimaryColor,
      textPrimaryColorDark: textPrimaryColorDark ?? this.textPrimaryColorDark,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      textSecondaryColorDark: textSecondaryColorDark ?? this.textSecondaryColorDark,
      textDisabledColor: textDisabledColor ?? this.textDisabledColor,
      textDisabledColorDark: textDisabledColorDark ?? this.textDisabledColorDark,
      borderColor: borderColor ?? this.borderColor,
      borderColorDark: borderColorDark ?? this.borderColorDark,
      borderFocusColor: borderFocusColor ?? this.borderFocusColor,
      borderFocusColorDark: borderFocusColorDark ?? this.borderFocusColorDark,
      hoverColor: hoverColor ?? this.hoverColor,
      hoverColorDark: hoverColorDark ?? this.hoverColorDark,
      pressedColor: pressedColor ?? this.pressedColor,
      pressedColorDark: pressedColorDark ?? this.pressedColorDark,
      disabledColor: disabledColor ?? this.disabledColor,
      disabledColorDark: disabledColorDark ?? this.disabledColorDark,
    );
  }

  /// Get color based on brightness
  Color getPrimary(Brightness brightness) =>
      brightness == Brightness.light ? primaryColor : primaryColorDark;

  Color getSecondary(Brightness brightness) =>
      brightness == Brightness.light ? secondaryColor : secondaryColorDark;

  Color getDanger(Brightness brightness) =>
      brightness == Brightness.light ? dangerColor : dangerColorDark;

  Color getSuccess(Brightness brightness) =>
      brightness == Brightness.light ? successColor : successColorDark;

  Color getWarning(Brightness brightness) =>
      brightness == Brightness.light ? warningColor : warningColorDark;

  Color getInfo(Brightness brightness) =>
      brightness == Brightness.light ? infoColor : infoColorDark;

  Color getBackground(Brightness brightness) =>
      brightness == Brightness.light ? backgroundColor : backgroundColorDark;

  Color getSurface(Brightness brightness) =>
      brightness == Brightness.light ? surfaceColor : surfaceColorDark;

  Color getSurfaceVariant(Brightness brightness) =>
      brightness == Brightness.light ? surfaceVariantColor : surfaceVariantColorDark;

  Color getTextPrimary(Brightness brightness) =>
      brightness == Brightness.light ? textPrimaryColor : textPrimaryColorDark;

  Color getTextSecondary(Brightness brightness) =>
      brightness == Brightness.light ? textSecondaryColor : textSecondaryColorDark;

  Color getTextDisabled(Brightness brightness) =>
      brightness == Brightness.light ? textDisabledColor : textDisabledColorDark;

  Color getBorder(Brightness brightness) =>
      brightness == Brightness.light ? borderColor : borderColorDark;

  Color getBorderFocus(Brightness brightness) =>
      brightness == Brightness.light ? borderFocusColor : borderFocusColorDark;

  Color getHover(Brightness brightness) =>
      brightness == Brightness.light ? hoverColor : hoverColorDark;

  Color getPressed(Brightness brightness) =>
      brightness == Brightness.light ? pressedColor : pressedColorDark;

  Color getDisabled(Brightness brightness) =>
      brightness == Brightness.light ? disabledColor : disabledColorDark;
}
