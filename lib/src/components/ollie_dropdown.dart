import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// A modern dropdown/select component with consistent styling
class OllieDropdown<T> extends StatefulWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<OllieDropdownItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final bool disabled;
  final String? errorText;
  final String? helperText;

  const OllieDropdown({
    super.key,
    this.label,
    this.hint,
    this.value,
    required this.items,
    this.onChanged,
    this.disabled = false,
    this.errorText,
    this.helperText,
  });

  @override
  State<OllieDropdown<T>> createState() => _OllieDropdownState<T>();
}

class _OllieDropdownState<T> extends State<OllieDropdown<T>> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    final labelColor = hasError
        ? (isDark
              ? OllieThemeConstants.darkDanger
              : OllieThemeConstants.lightDanger)
        : OllieThemeConstants.getSecondaryTextColor(brightness);

    final textColor = widget.disabled
        ? OllieThemeConstants.getSecondaryTextColor(brightness)
        : OllieThemeConstants.getTextColor(brightness);

    final hintColor = isDark
        ? OllieThemeConstants.darkTextSecondary
        : OllieThemeConstants.lightTextSecondary;

    final borderColor = OllieThemeConstants.getBorderColor(brightness);
    final focusColor = OllieThemeConstants.getPrimaryColor(brightness);
    final errorColor = isDark
        ? OllieThemeConstants.darkDanger
        : OllieThemeConstants.lightDanger;

    final fillColor = widget.disabled
        ? (isDark
              ? OllieThemeConstants.darkDisabled
              : OllieThemeConstants.lightDisabled)
        : (hasError
              ? (isDark ? const Color(0xFF3D1F1F) : const Color(0xFFFFEBEE))
              : _focusNode.hasFocus
              ? (isDark ? const Color(0xFF1A2A3D) : const Color(0xFFE3F2FD))
              : (isDark
                    ? OllieThemeConstants.darkSurfaceContainerLowest
                    : OllieThemeConstants.lightSurfaceVariant));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: OllieThemeConstants.fontSizeSmall,
              fontWeight: OllieThemeConstants.fontWeightSemiBold,
              color: labelColor,
            ),
          ),
          const SizedBox(height: OllieThemeConstants.spacingSmall),
        ],
        Container(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(
              OllieThemeConstants.borderRadiusMedium,
            ),
            border: Border.all(
              color: hasError
                  ? errorColor
                  : _focusNode.hasFocus
                  ? focusColor
                  : borderColor,
              width: _focusNode.hasFocus ? 2 : 1.5,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<T>(
                value: widget.value,
                hint: widget.hint != null
                    ? Text(
                        widget.hint!,
                        style: TextStyle(
                          color: hintColor,
                          fontSize: OllieThemeConstants.fontSizeBody,
                        ),
                      )
                    : null,
                isExpanded: true,
                focusNode: _focusNode,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: widget.disabled ? hintColor : textColor,
                ),
                style: TextStyle(
                  fontSize: OllieThemeConstants.fontSizeBody,
                  color: textColor,
                ),
                dropdownColor: isDark
                    ? OllieThemeConstants.darkSurfaceContainerHigh
                    : OllieThemeConstants.lightSurface,
                borderRadius: BorderRadius.circular(
                  OllieThemeConstants.borderRadiusMedium,
                ),
                items: widget.items.map((item) {
                  return DropdownMenuItem<T>(
                    value: item.value,
                    enabled: !item.disabled,
                    child: Row(
                      children: [
                        if (item.icon != null) ...[
                          Icon(
                            item.icon,
                            size: 20,
                            color: item.disabled ? hintColor : textColor,
                          ),
                          const SizedBox(
                            width: OllieThemeConstants.spacingSmall,
                          ),
                        ],
                        Expanded(
                          child: Text(
                            item.label,
                            style: TextStyle(
                              color: item.disabled ? hintColor : textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: widget.disabled ? null : widget.onChanged,
              ),
            ),
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: OllieThemeConstants.spacingSmall),
          Row(
            children: [
              Icon(Icons.error_outline, size: 16, color: errorColor),
              const SizedBox(width: OllieThemeConstants.spacingSmall),
              Expanded(
                child: Text(
                  widget.errorText!,
                  style: TextStyle(
                    fontSize: OllieThemeConstants.fontSizeSmall,
                    color: errorColor,
                    fontWeight: OllieThemeConstants.fontWeightMedium,
                  ),
                ),
              ),
            ],
          ),
        ] else if (widget.helperText != null) ...[
          const SizedBox(height: OllieThemeConstants.spacingSmall),
          Text(
            widget.helperText!,
            style: TextStyle(
              fontSize: OllieThemeConstants.fontSizeSmall,
              color: OllieThemeConstants.getSecondaryTextColor(brightness),
            ),
          ),
        ],
      ],
    );
  }
}

/// Dropdown item with optional icon
class OllieDropdownItem<T> {
  final T value;
  final String label;
  final IconData? icon;
  final bool disabled;

  const OllieDropdownItem({
    required this.value,
    required this.label,
    this.icon,
    this.disabled = false,
  });
}
