import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// A modern card component with consistent styling
class OllieCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final bool elevated;
  final Color? backgroundColor;
  final Border? border;

  const OllieCard({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.onTap,
    this.elevated = true,
    this.backgroundColor,
    this.border,
  });

  /// Card with no elevation (flat design)
  const OllieCard.flat({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.onTap,
    this.backgroundColor,
    this.border,
  }) : elevated = false;

  /// Card with custom border
  const OllieCard.outlined({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.onTap,
    this.backgroundColor,
  }) : elevated = false,
       border = null;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    final effectiveBackgroundColor =
        backgroundColor ??
        (isDark
            ? OllieThemeConstants.darkSurfaceContainerLow
            : OllieThemeConstants.lightSurface);

    final effectiveBorder =
        border ??
        Border.all(
          color: OllieThemeConstants.getBorderColor(brightness),
          width: elevated ? 0 : 1,
        );

    final widget = Container(
      width: width,
      height: height,
      padding:
          padding ?? const EdgeInsets.all(OllieThemeConstants.spacingMedium),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: BorderRadius.circular(
          OllieThemeConstants.borderRadiusMedium,
        ),
        border: elevated ? null : effectiveBorder,
        boxShadow: elevated ? OllieThemeConstants.getShadow(brightness) : null,
      ),
      child: child,
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            OllieThemeConstants.borderRadiusMedium,
          ),
          child: widget,
        ),
      );
    }

    return widget;
  }
}
