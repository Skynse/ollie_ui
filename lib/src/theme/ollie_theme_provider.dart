import 'package:flutter/material.dart';
import 'ollie_theme_data.dart';

/// An InheritedWidget that provides [OllieThemeData] to descendant widgets.
///
/// Wrap your app or a subtree with this widget to customize Ollie UI colors:
///
/// ```dart
/// OllieThemeProvider(
///   theme: OllieThemeData(
///     primaryColor: Colors.purple,
///     primaryColorDark: Colors.purpleAccent,
///     successColor: Colors.teal,
///   ),
///   child: MaterialApp(
///     theme: OllieTheme.lightTheme,
///     darkTheme: OllieTheme.darkTheme,
///     home: MyApp(),
///   ),
/// );
/// ```
class OllieThemeProvider extends InheritedWidget {
  /// The theme data to provide to descendants.
  final OllieThemeData theme;

  const OllieThemeProvider({
    super.key,
    required this.theme,
    required super.child,
  });

  /// Returns the [OllieThemeData] from the closest [OllieThemeProvider] ancestor.
  ///
  /// If there is no ancestor, returns null.
  static OllieThemeData? maybeOf(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<OllieThemeProvider>();
    return provider?.theme;
  }

  /// Returns the [OllieThemeData] from the closest [OllieThemeProvider] ancestor.
  ///
  /// If there is no ancestor, returns the default [OllieThemeData].
  static OllieThemeData of(BuildContext context) {
    return maybeOf(context) ?? const OllieThemeData();
  }

  @override
  bool updateShouldNotify(OllieThemeProvider oldWidget) {
    return theme != oldWidget.theme;
  }
}
