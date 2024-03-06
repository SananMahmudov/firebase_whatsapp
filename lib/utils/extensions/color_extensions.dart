import 'package:flutter/material.dart';

extension ColorExtension on Color {
  // Convert color to material color
  MaterialColor get toMaterialColor => MaterialColor(
        value,
        <int, Color>{
          50: withOpacity(.1),
          100: withOpacity(.2),
          200: withOpacity(.3),
          300: withOpacity(0.4),
          400: withOpacity(0.5),
          500: withOpacity(0.6),
          600: withOpacity(0.7),
          700: withOpacity(0.8),
          800: withOpacity(0.9),
          900: withOpacity(1.0),
        },
      );
}
