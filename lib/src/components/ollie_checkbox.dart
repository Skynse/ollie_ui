import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// A modern checkbox component with consistent styling
class OllieCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String? label;
  final bool disabled;

  const OllieCheckbox({
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
              _buildCheckbox(context, primaryColor),
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

    return _buildCheckbox(context, primaryColor);
  }

  Widget _buildCheckbox(BuildContext context, Color primaryColor) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Checkbox(
        value: value,
        onChanged: disabled ? null : onChanged,
        activeColor: primaryColor,
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        side: BorderSide(
          color: disabled
              ? OllieThemeConstants.getBorderColor(Theme.of(context).brightness)
              : primaryColor,
          width: 2,
        ),
      ),
    );
  }
}

/// A group of checkboxes with a common label
class OllieCheckboxGroup extends StatelessWidget {
  final String? label;
  final List<OllieCheckboxOption> options;
  final List<String> values;
  final ValueChanged<List<String>> onChanged;
  final bool disabled;

  const OllieCheckboxGroup({
    super.key,
    this.label,
    required this.options,
    required this.values,
    required this.onChanged,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

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
        ...options.map((option) {
          final isChecked = values.contains(option.value);
          return OllieCheckbox(
            value: isChecked,
            onChanged: disabled || option.disabled
                ? null
                : (checked) {
                    final newValues = List<String>.from(values);
                    if (checked == true) {
                      newValues.add(option.value);
                    } else {
                      newValues.remove(option.value);
                    }
                    onChanged(newValues);
                  },
            label: option.label,
            disabled: disabled || option.disabled,
          );
        }),
      ],
    );
  }
}

/// Option for checkbox groups
class OllieCheckboxOption {
  final String value;
  final String label;
  final bool disabled;

  const OllieCheckboxOption({
    required this.value,
    required this.label,
    this.disabled = false,
  });
}
