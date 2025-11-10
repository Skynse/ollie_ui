import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// A modern switch/toggle component with consistent styling
class OllieSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  final bool disabled;

  const OllieSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.label,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final primaryColor = OllieThemeConstants.getPrimaryColor(brightness);

    if (label != null) {
      return InkWell(
        onTap: disabled ? null : () => onChanged?.call(!value),
        borderRadius: BorderRadius.circular(
          OllieThemeConstants.borderRadiusSmall,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: OllieThemeConstants.spacingSmall,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: OllieThemeConstants.fontSizeBody,
                  color: disabled
                      ? OllieThemeConstants.getSecondaryTextColor(brightness)
                      : OllieThemeConstants.getTextColor(brightness),
                ),
              ),
              const SizedBox(width: OllieThemeConstants.spacingMedium),
              _buildSwitch(context, primaryColor),
            ],
          ),
        ),
      );
    }

    return _buildSwitch(context, primaryColor);
  }

  Widget _buildSwitch(BuildContext context, Color primaryColor) {
    return Switch(
      value: value,
      onChanged: disabled ? null : onChanged,
      activeColor: primaryColor,
      activeTrackColor: primaryColor.withValues(alpha: 0.5),
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey.shade700
          : Colors.grey.shade400,
    );
  }
}
