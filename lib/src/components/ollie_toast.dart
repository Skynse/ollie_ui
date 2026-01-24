import 'package:flutter/material.dart';
import 'package:ollie_ui/src/theme/theme_constants.dart';

/// Toast notification types
enum OllieToastType { success, error, info, warning }

/// Modern toast notification widget for Ollie app
class OllieToast {
  /// Show a success toast
  static void success(BuildContext context, String message) {
    _showToast(context, message, OllieToastType.success);
  }

  /// Show an error toast
  static void error(BuildContext context, String message) {
    _showToast(context, message, OllieToastType.error);
  }

  /// Show an info toast
  static void info(BuildContext context, String message) {
    _showToast(context, message, OllieToastType.info);
  }

  /// Show a warning toast
  static void warning(BuildContext context, String message) {
    _showToast(context, message, OllieToastType.warning);
  }

  static void _showToast(
    BuildContext context,
    String message,
    OllieToastType type,
  ) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(message: message, type: type),
    );

    overlay.insert(overlayEntry);

    // Auto-dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final OllieToastType type;

  const _ToastWidget({required this.message, required this.type});

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();

    // Start fade out animation before removal
    Future.delayed(const Duration(milliseconds: 2700), () {
      if (mounted) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getBackgroundColor(BuildContext context) {
    final baseColor = _getBaseColor(context);
    return Color.alphaBlend(baseColor.withOpacity(0.1), Colors.white);
  }

  Color _getBorderColor(BuildContext context) {
    final baseColor = _getBaseColor(context);
    return baseColor.withOpacity(0.4);
  }

  Color _getIconColor(BuildContext context) {
    return _getBaseColor(context);
  }

  Color _getBaseColor(BuildContext context) {
    switch (widget.type) {
      case OllieToastType.success:
        return OllieThemeConstants.getSuccessColorFromContext(context);
      case OllieToastType.error:
        return OllieThemeConstants.getDangerColorFromContext(context);
      case OllieToastType.info:
        return OllieThemeConstants.getInfoColorFromContext(context);
      case OllieToastType.warning:
        return OllieThemeConstants.getWarningColorFromContext(context);
    }
  }

  IconData _getIcon() {
    switch (widget.type) {
      case OllieToastType.success:
        return Icons.check_circle;
      case OllieToastType.error:
        return Icons.error;
      case OllieToastType.info:
        return Icons.info;
      case OllieToastType.warning:
        return Icons.warning;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 24,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: _getBackgroundColor(context),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _getBorderColor(context)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(_getIcon(), color: _getIconColor(context), size: 20),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        widget.message,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: OllieThemeConstants.getTextColorFromContext(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
