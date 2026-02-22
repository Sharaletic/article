import '../../ui_kit.dart';

enum ButtonVariant { filledPrimary, filledSecondary, text, segmented }

class UiButton extends ButtonStyleButton {
  final ButtonVariant variant;

  UiButton.filledPrimary({
    required VoidCallback? onPressed,
    bool enabled = true,
    IconAlignment iconAlignment = .start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus = false,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = .filledPrimary,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
         ),
         onPressed: enabled ? onPressed : null,
         onLongPress: enabled ? onLongPress : null,
       );

  UiButton.filledSecondary({
    required VoidCallback? onPressed,
    bool enabled = true,
    IconAlignment iconAlignment = .start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.autofocus = false,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = ButtonVariant.filledSecondary,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
         ),
         onPressed: enabled ? onPressed : null,
         onLongPress: enabled ? onLongPress : null,
       );

  UiButton.text({
    required VoidCallback onPressed,
    bool enabled = true,
    IconAlignment iconAlignment = IconAlignment.start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.autofocus = false,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = .text,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
         ),
         onPressed: enabled ? onPressed : null,
         onLongPress: enabled ? onLongPress : null,
       );

  UiButton.segmented({
    required VoidCallback onPressed,
    bool enabled = true,
    IconAlignment iconAlignment = .start,
    Widget? label,
    Widget? icon,
    VoidCallback? onLongPress,
    super.autofocus = false,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.clipBehavior,
    super.statesController,
    super.isSemanticButton,
    super.key,
  }) : variant = .segmented,
       super(
         child: _ButtonIconAndLabel(
           icon: icon,
           label: label,
           iconAlignment: iconAlignment,
         ),
         onPressed: enabled ? onPressed : null,
         onLongPress: enabled ? onLongPress : null,
       );

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorPalette;
    final typography = theme.appTypography;

    return switch (variant) {
      .filledPrimary => _FilledButtonPrimaryStyle(
        colorPalette: colors,
        typography: typography,
      ),
      .filledSecondary => _FilledButtonSecondaryStyle(
        colorPalette: colors,
        typography: typography,
      ),
      .segmented => _SegmentedButtonStyle(
        colorPalette: colors,
        typography: typography,
      ),
      .text => _TextButtonStyle(colorPalette: colors, typography: typography),
    };
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) => null;
}

class _ButtonIconAndLabel extends StatelessWidget {
  const _ButtonIconAndLabel({
    required this.icon,
    required this.label,
    required this.iconAlignment,
  });

  final Widget? icon;
  final Widget? label;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: iconAlignment == IconAlignment.start
        ? [
            if (icon != null) icon!,
            if (icon != null && label != null) const SizedBox(width: 8),
            if (label != null) Flexible(child: label!),
          ]
        : [
            if (label != null) Flexible(child: label!),
            if (icon != null && label != null) const SizedBox(width: 8),
            if (icon != null) icon!,
          ],
  );
}

class _FilledButtonPrimaryStyle extends _UiBaseButtonStyle {
  const _FilledButtonPrimaryStyle({
    required super.colorPalette,
    required super.typography,
  });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.mutedForeground;
        }
        return colorPalette.primaryForeground;
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.muted;
        }
        return colorPalette.primary;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        final color = colorPalette.primaryForeground;

        if (states.contains(WidgetState.pressed)) {
          return color.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return color.withValues(alpha: 0.1);
        }
        return null;
      });

  @override
  WidgetStateProperty<double>? get elevation =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return 0.0;
        }
        if (states.contains(WidgetState.pressed)) {
          return 0.0;
        }
        if (states.contains(WidgetState.hovered)) {
          return 0.0;
        }
        if (states.contains(WidgetState.focused)) {
          return 0.0;
        }
        return 0.0;
      });

  @override
  WidgetStateProperty<Color>? get shadowColor => WidgetStatePropertyAll<Color>(
    colorPalette.foreground.withValues(alpha: .18),
  );
}

class _FilledButtonSecondaryStyle extends _UiBaseButtonStyle {
  const _FilledButtonSecondaryStyle({
    required super.colorPalette,
    required super.typography,
  });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.secondary.withValues(alpha: .38);
        }
        return colorPalette.secondaryForeground;
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.secondary.withValues(alpha: .12);
        }
        return colorPalette.secondary;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        final color = colorPalette.secondaryForeground;

        if (states.contains(WidgetState.pressed)) {
          return color.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return color.withValues(alpha: 0.1);
        }
        return null;
      });

  @override
  WidgetStateProperty<double>? get elevation =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return 0.0;
        }
        if (states.contains(WidgetState.pressed)) {
          return 0.0;
        }
        if (states.contains(WidgetState.hovered)) {
          return 1.0;
        }
        if (states.contains(WidgetState.focused)) {
          return 0.0;
        }
        return 0.0;
      });

  @override
  WidgetStateProperty<Color>? get shadowColor => WidgetStatePropertyAll<Color>(
    colorPalette.foreground.withValues(alpha: .18),
  );
}

class _TextButtonStyle extends _UiBaseButtonStyle {
  const _TextButtonStyle({
    required super.colorPalette,
    required super.typography,
  });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      const WidgetStatePropertyAll(Colors.transparent);

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.mutedForeground;
        }
        return colorPalette.primary;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return colorPalette.primary.withValues(alpha: 0.1);
        }
        if (states.contains(WidgetState.hovered)) {
          return colorPalette.primary.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return colorPalette.primary.withValues(alpha: 0.1);
        }
        return null;
      });
}

class _SegmentedButtonStyle extends _UiBaseButtonStyle {
  const _SegmentedButtonStyle({
    required super.colorPalette,
    required super.typography,
  });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.mutedForeground;
        }
        return colorPalette.primaryForeground;
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return colorPalette.muted;
        }
        if (states.contains(WidgetState.pressed)) {
          return colorPalette.destructiveBorder;
        }
        if (states.contains(WidgetState.hovered)) {
          return colorPalette.destructiveBorder;
        }
        return Colors.transparent;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        final color = colorPalette.secondary;
        if (states.contains(WidgetState.pressed)) {
          return color.withValues(alpha: 0.4);
        }
        if (states.contains(WidgetState.hovered)) {
          return color.withValues(alpha: 0.08);
        }
        if (states.contains(WidgetState.focused)) {
          return color.withValues(alpha: 0.1);
        }
        return null;
      });

  @override
  WidgetStateProperty<double>? get elevation =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return 0.0;
        }
        if (states.contains(WidgetState.pressed)) {
          return 0.0;
        }
        if (states.contains(WidgetState.hovered)) {
          return 0.0;
        }
        if (states.contains(WidgetState.focused)) {
          return 0.0;
        }
        return 0.0;
      });

  @override
  WidgetStateProperty<Color>? get shadowColor => WidgetStatePropertyAll<Color>(
    colorPalette.foreground.withValues(alpha: .18),
  );
}

class _UiBaseButtonStyle extends ButtonStyle {
  const _UiBaseButtonStyle({
    required this.colorPalette,
    required this.typography,
  });

  final ColorPalette colorPalette;
  final AppTypography typography;

  @override
  AlignmentGeometry? get alignment => Alignment.center;

  @override
  Duration? get animationDuration => const Duration(milliseconds: 200);

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: .all(.circular(12))),
      );

  @override
  MaterialTapTargetSize? get tapTargetSize => MaterialTapTargetSize.shrinkWrap;

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(.symmetric(horizontal: 16, vertical: 12));

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(100, 40));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size.infinite);

  @override
  WidgetStateProperty<TextStyle?>? get textStyle => WidgetStatePropertyAll(
    typography.titleMedium.copyWith(fontWeight: FontWeight.w600),
  );

  @override
  WidgetStateProperty<Color>? get shadowColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  VisualDensity? get visualDensity => VisualDensity.adaptivePlatformDensity;

  @override
  WidgetStateProperty<Color>? get surfaceTintColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<double?>? get elevation =>
      const WidgetStatePropertyAll(0);

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      });

  @override
  WidgetStateProperty<double>? get iconSize =>
      const WidgetStatePropertyAll<double>(18.0);

  @override
  ButtonLayerBuilder? get backgroundBuilder => _backgroundBuilder;

  Widget _backgroundBuilder(
    BuildContext context,
    Set<WidgetState> states,
    Widget? child,
  ) {
    if (child == null) return const SizedBox.shrink();

    return OutlineFocusButtonBorder(
      showBorder: states.contains(WidgetState.focused),
      border: RoundedRectangleBorder(
        side: BorderSide(color: colorPalette.ring, width: 2),
        borderRadius: .circular(8),
      ),
      child: child,
    );
  }
}

class OutlineFocusButtonBorder extends StatelessWidget {
  const OutlineFocusButtonBorder({
    required this.child,
    required this.showBorder,
    required this.border,
    super.key,
  });

  final Widget child;
  final bool showBorder;
  final ShapeBorder border;

  @override
  Widget build(BuildContext context) => CustomPaint(
    painter: _OutlineFocusButtonBorderPainter(
      showBorder: showBorder,
      border: border,
    ),
    child: child,
  );
}

class _OutlineFocusButtonBorderPainter extends CustomPainter {
  _OutlineFocusButtonBorderPainter({
    required bool showBorder,
    required ShapeBorder border,
  }) : _showBorder = showBorder,
       _border = border;

  final bool _showBorder;
  final ShapeBorder _border;

  @override
  void paint(Canvas canvas, Size size) {
    if (!_showBorder) return;

    final rect = Offset.zero & size;

    _border.paint(canvas, rect);
  }

  @override
  bool shouldRepaint(_OutlineFocusButtonBorderPainter oldDelegate) =>
      _showBorder != oldDelegate._showBorder || _border != oldDelegate._border;

  @override
  bool shouldRebuildSemantics(_OutlineFocusButtonBorderPainter oldDelegate) =>
      false;
}
