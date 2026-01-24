import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// Badge variant types
enum OllieBadgeVariant { primary, secondary, success, warning, danger, info }

/// A modern badge component for displaying small counts or status indicators
class OllieBadge extends StatelessWidget {
  final Widget child;
  final OllieBadgeVariant variant;
  final bool dot;

  const OllieBadge({
    super.key,
    required this.child,
    this.variant = OllieBadgeVariant.primary,
    this.dot = false,
  });

  /// Success badge (green)
  const OllieBadge.success({super.key, required this.child, this.dot = false})
    : variant = OllieBadgeVariant.success;

  /// Warning badge (orange)
  const OllieBadge.warning({super.key, required this.child, this.dot = false})
    : variant = OllieBadgeVariant.warning;

  /// Danger badge (red)
  const OllieBadge.danger({super.key, required this.child, this.dot = false})
    : variant = OllieBadgeVariant.danger;

  /// Info badge (blue)
  const OllieBadge.info({super.key, required this.child, this.dot = false})
    : variant = OllieBadgeVariant.info;

  /// Dot-only badge (small circle indicator)
  const OllieBadge.dot({super.key, this.variant = OllieBadgeVariant.danger})
    : child = const SizedBox.shrink(),
      dot = true;

  Color _getBackgroundColor(BuildContext context) {
    switch (variant) {
      case OllieBadgeVariant.primary:
        return OllieThemeConstants.getPrimaryColorFromContext(context);
      case OllieBadgeVariant.secondary:
        return OllieThemeConstants.getSecondaryColorFromContext(context);
      case OllieBadgeVariant.success:
        return OllieThemeConstants.getSuccessColorFromContext(context);
      case OllieBadgeVariant.warning:
        return OllieThemeConstants.getWarningColorFromContext(context);
      case OllieBadgeVariant.danger:
        return OllieThemeConstants.getDangerColorFromContext(context);
      case OllieBadgeVariant.info:
        return OllieThemeConstants.getInfoColorFromContext(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor(context);

    if (dot) {
      return Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        child: child,
      ),
    );
  }
}

/// A widget that positions a badge on top of a child widget
class OllieBadgedWidget extends StatelessWidget {
  final Widget child;
  final OllieBadge badge;
  final AlignmentGeometry alignment;

  const OllieBadgedWidget({
    super.key,
    required this.child,
    required this.badge,
    this.alignment = Alignment.topRight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: alignment == Alignment.topRight || alignment == Alignment.topLeft
              ? -4
              : null,
          bottom:
              alignment == Alignment.bottomRight ||
                  alignment == Alignment.bottomLeft
              ? -4
              : null,
          right:
              alignment == Alignment.topRight ||
                  alignment == Alignment.bottomRight
              ? -4
              : null,
          left:
              alignment == Alignment.topLeft ||
                  alignment == Alignment.bottomLeft
              ? -4
              : null,
          child: badge,
        ),
      ],
    );
  }
}
