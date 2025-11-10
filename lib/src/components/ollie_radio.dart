import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// A modern radio button component with consistent styling
class OllieRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String? label;
  final bool disabled;

  const OllieRadio({
    super.key,
    required this.value,
    required this.groupValue,
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
        onTap: disabled ? null : () => onChanged?.call(value),
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
              _buildRadio(context, primaryColor),
              const SizedBox(width: OllieThemeConstants.spacingSmall),
              Text(
                label!,
                style: TextStyle(
                  fontSize: OllieThemeConstants.fontSizeBody,
                  color: disabled
                      ? OllieThemeConstants.getSecondaryTextColor(brightness)
                      : OllieThemeConstants.getTextColor(brightness),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _buildRadio(context, primaryColor);
  }

  Widget _buildRadio(BuildContext context, Color primaryColor) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: disabled ? null : onChanged,
        activeColor: primaryColor,
      ),
    );
  }
}

/// A group of radio buttons with a common label
class OllieRadioGroup<T> extends StatelessWidget {
  final String? label;
  final List<OllieRadioOption<T>> options;
  final T? value;
  final ValueChanged<T?> onChanged;
  final bool disabled;
  final Axis direction;

  const OllieRadioGroup({
    super.key,
    this.label,
    required this.options,
    required this.value,
    required this.onChanged,
    this.disabled = false,
    this.direction = Axis.vertical,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    final radioWidgets = options.map((option) {
      return OllieRadio<T>(
        value: option.value,
        groupValue: value as T,
        onChanged: disabled || option.disabled ? null : onChanged,
        label: option.label,
        disabled: disabled || option.disabled,
      );
    }).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontSize: OllieThemeConstants.fontSizeSmall,
              fontWeight: OllieThemeConstants.fontWeightSemiBold,
              color: OllieThemeConstants.getSecondaryTextColor(brightness),
            ),
          ),
          const SizedBox(height: OllieThemeConstants.spacingSmall),
        ],
        if (direction == Axis.vertical)
          ...radioWidgets
        else
          Wrap(
            spacing: OllieThemeConstants.spacingMedium,
            runSpacing: OllieThemeConstants.spacingSmall,
            children: radioWidgets,
          ),
      ],
    );
  }
}

/// Option for radio groups
class OllieRadioOption<T> {
  final T value;
  final String label;
  final bool disabled;

  const OllieRadioOption({
    required this.value,
    required this.label,
    this.disabled = false,
  });
}
