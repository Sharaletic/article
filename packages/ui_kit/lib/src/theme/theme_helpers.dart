import '../../ui_kit.dart';

final lightColorPalette = generatePaletteForBrightness(Brightness.light);
final darkColorPalette = generatePaletteForBrightness(Brightness.dark);

ThemeData createThemeData({
  required ColorPalette palette,
  required AppTypography typography,
  required Brightness brightness,
}) => ThemeData(
  brightness: brightness,
  fontFamily: 'SfPro',
  extensions: {palette, typography},
);

ColorPalette generatePaletteForBrightness(Brightness brightness) {
  final isDart = brightness == Brightness.dark;

  return ColorPalette(
    background: isDart
        ? _darkColorPalette.background
        : _lightColorPalette.background,
    foreground: isDart
        ? _darkColorPalette.foreground
        : _lightColorPalette.foreground,
    muted: isDart ? _darkColorPalette.muted : _lightColorPalette.muted,
    mutedForeground: isDart
        ? _darkColorPalette.mutedForeground
        : _lightColorPalette.mutedForeground,
    primary: isDart ? _darkColorPalette.primary : _lightColorPalette.primary,
    primaryForeground: isDart
        ? _darkColorPalette.primaryForeground
        : _lightColorPalette.primaryForeground,
    secondary: isDart
        ? _darkColorPalette.secondary
        : _lightColorPalette.secondary,
    secondaryForeground: isDart
        ? _darkColorPalette.secondaryForeground
        : _lightColorPalette.secondaryForeground,
    destructiveBorder: isDart
        ? _darkColorPalette.destructiveBorder
        : _lightColorPalette.destructiveBorder,
    destructiveForeground: isDart
        ? _darkColorPalette.destructiveForeground
        : _lightColorPalette.destructiveForeground,
    ring: isDart ? _darkColorPalette.ring : _lightColorPalette.ring,
  );
}

final _material2021 = Typography.material2021().tall;

final AppTypography defaultTypography = AppTypography(
  displayLarge: _material2021.displayLarge!,
  displayMedium: _material2021.displayMedium!,
  displaySmall: _material2021.displaySmall!,
  headlineLarge: _material2021.headlineLarge!,
  headlineMedium: _material2021.headlineMedium!,
  headlineSmall: _material2021.headlineSmall!,
  titleLarge: _material2021.titleLarge!,
  titleMedium: _material2021.titleMedium!,
  titleSmall: _material2021.titleSmall!,
  bodyLarge: _material2021.bodyLarge!,
  bodyMedium: _material2021.bodyMedium!,
  bodySmall: _material2021.bodySmall!,
  labelLarge: _material2021.labelLarge!,
  labelMedium: _material2021.labelMedium!,
  labelSmall: _material2021.labelSmall!,
);

final _lightColorPalette = ColorPalette(
  background: Color(0xFFFFFFFF),
  foreground: Color(0xFF000000),
  muted: Color(0xFF2761CA).withValues(alpha: 0.7),
  mutedForeground: Color(0xFFDEDEDE).withValues(alpha: 0.7),
  primary: Color(0xFF2761CA),
  primaryForeground: Color(0xFFFFFFFF),
  secondary: Color(0xFFF2F2F2),
  secondaryForeground: Color(0xFF838384),
  destructiveBorder: Color(0xFFFA233B),
  destructiveForeground: Color(0xFFFA233B),
  ring: Color(0xFF3C8BFA),
);

final _darkColorPalette = ColorPalette(
  background: Color(0xFF111111),
  foreground: Color(0xFFFFFFFF),
  muted: Color(0xFF2761CA).withValues(alpha: 0.7),
  mutedForeground: Color(0xFFDEDEDE).withValues(alpha: 0.7),
  primary: Color(0xFF2761CA),
  primaryForeground: Color(0xFFFFFFFF),
  secondary: Color(0xFF262626),
  secondaryForeground: Color(0xFF838384),
  destructiveBorder: Color(0xFFFA233B),
  destructiveForeground: Color(0xFFFA233B),
  ring: Color(0xFF3C8BFA),
);
