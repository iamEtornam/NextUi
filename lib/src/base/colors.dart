import 'package:flutter/material.dart';

/// Contains all colors used in Next UI
class NextUiColors {

  /// usage:
  /// `NextUiColors.primary[50]`
  ///  `NextUiColors.primary.shade.50`
  static final MaterialColor primary =
      MaterialColor(const Color(0xFF001731).value, const <int, Color>{
    50: Color(0xFFe6f1fe),
    100: Color(0xFFcce3fd),
    200: Color(0xFF99c7fb),
    300: Color(0xFFd4d4d8),
    400: Color(0xFF338ef7),
    500: Color(0xFF006FEE),
    600: Color(0xFF005bc4),
    700: Color(0xFF004493),
    800: Color(0xFF002e62),
    900: Color(0xFF001731),
  });

  /// usage:
  /// `NextUiColors.secondary[50]`
  /// `NextUiColors.secondary.50`
  static final MaterialColor secondary =
      MaterialColor(const Color(0xFF180828).value, const <int, Color>{
    50: Color(0xFFf2eafa),
    100: Color(0xFFe4d4f4),
    200: Color(0xFFc9a9e9),
    300: Color(0xFFae7ede),
    400: Color(0xFF9353d3),
    500: Color(0xFF7828c8),
    600: Color(0xFF6020a0),
    700: Color(0xFF481878),
    800: Color(0xFF301050),
    900: Color(0xFF180828),
  });



  /// usage:
  /// `NextUiColors.success[50]`
  /// `NextUiColors.success.50`
  static final MaterialColor success =
      MaterialColor(const Color(0xFF052814).value, const <int, Color>{
    50: Color(0xFFe8faf0),
    100: Color(0xFFd1f4e0),
    200: Color(0xFFa2e9c1),
    300: Color(0xFF74dfa2),
    400: Color(0xFF45d483),
    500: Color(0xFF17c964),
    600: Color(0xFF12a150),
    700: Color(0xFF0e793c),
    800: Color(0xFF095028),
    900: Color(0xFF052814),
  });

  /// usage:
  /// `NextUiColors.warning[50]`
  /// `NextUiColors.warning.50`
  static final MaterialColor warning =
      MaterialColor(const Color(0xFF312107).value, const <int, Color>{
    50: Color(0xFFfefce8),
    100: Color(0xFFfdedd3),
    200: Color(0xFFfbdba7),
    300: Color(0xFFf9c97c),
    400: Color(0xFFf7b750),
    500: Color(0xFFf5a524),
    600: Color(0xFFc4841d),
    700: Color(0xFF936316),
    800: Color(0xFF62420e),
    900: Color(0xFF312107),
  });

  /// usage:
  /// `NextUiColors.danger[50]`
  /// `NextUiColors.danger.50`
  static final MaterialColor danger =
      MaterialColor(const Color(0xFF310413).value, const <int, Color>{
    50: Color(0xFFfee7ef),
    100: Color(0xFFfdd0df),
    200: Color(0xFFfaa0bf),
    300: Color(0xFFf871a0),
    400: Color(0xFFf54180),
    500: Color(0xFFf31260),
    600: Color(0xFFc20e4d),
    700: Color(0xFF920b3a),
    800: Color(0xFF610726),
    900: Color(0xFF310413),
  });
}
