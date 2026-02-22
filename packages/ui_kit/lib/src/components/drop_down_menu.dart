import 'package:ui_kit/ui_kit.dart';

enum UiDropDownMenuVariant { standard }

class UiDropDownMenu<T extends Object> extends StatefulWidget {
  const UiDropDownMenu.standard({
    required this.dropdownMenuEntries,
    this.hintText,
    this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.selectedTrailingIcon,
    this.width,
    this.expandedInsets,
    this.controller,
    this.enabled = true,
    this.enableFilter = true,
    this.enableSearch = true,
    this.requestFocusOnTap = true,
    this.initialSelection,
    this.onSelected,
    required this.itemValueMenuBuilder,
    required this.itemLabelMenuBuilder,
    this.itemIconMenuBuilder,
    this.textStyle,
    super.key,
  }) : variant = UiDropDownMenuVariant.standard;

  final List<T> dropdownMenuEntries;
  final String? hintText;
  final Widget? label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? selectedTrailingIcon;
  final double? width;
  final EdgeInsetsGeometry? expandedInsets;
  final TextEditingController? controller;
  final bool enabled;
  final bool enableSearch;
  final bool enableFilter;
  final bool requestFocusOnTap;
  final T? initialSelection;
  final ValueChanged<T?>? onSelected;
  final T Function(T) itemValueMenuBuilder;
  final String Function(T) itemLabelMenuBuilder;
  final Widget Function(T)? itemIconMenuBuilder;
  final TextStyle? textStyle;
  final UiDropDownMenuVariant variant;

  @override
  State<UiDropDownMenu<T>> createState() => _DropDownMenuState<T>();
}

class _DropDownMenuState<T extends Object> extends State<UiDropDownMenu<T>> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.colorPalette;
    final typography = theme.appTypography;

    final variantButtonMenyStyle = switch (widget.variant) {
      UiDropDownMenuVariant.standard => _StandardMenuButtonStyle(
        palette: palette,
        typography: typography,
      ),
    };

    final entries = widget.dropdownMenuEntries
        .map(
          (items) => DropdownMenuEntry<T>(
            label: widget.itemLabelMenuBuilder(items),
            value: widget.itemValueMenuBuilder(items),
            leadingIcon: widget.itemIconMenuBuilder?.call(items),
            style: variantButtonMenyStyle,
          ),
        )
        .toList();

    final variantMenyStyle = switch (widget.variant) {
      UiDropDownMenuVariant.standard => _StandardUiDropDownMenuStyle(
        palette: palette,
      ),
    };

    final variantTextInputStyle = switch (widget.variant) {
      UiDropDownMenuVariant.standard => _buildInputDecorationTheme(
        palette: palette,
        typography: typography,
      ),
    };

    return DropdownMenu<T>(
      cursorHeight: 16,
      dropdownMenuEntries: entries,
      label: widget.label,
      hintText: widget.hintText,
      leadingIcon: widget.leadingIcon,
      trailingIcon: widget.trailingIcon,
      selectedTrailingIcon: widget.selectedTrailingIcon,
      width: widget.width,
      expandedInsets: widget.expandedInsets,
      controller: widget.controller,
      enabled: widget.enabled,
      enableFilter: widget.enableFilter,
      enableSearch: widget.enableSearch,
      requestFocusOnTap: widget.requestFocusOnTap,
      initialSelection: widget.initialSelection,
      onSelected: (value) => widget.onSelected?.call(value),
      textStyle:
          widget.textStyle ??
          typography.bodyMedium.copyWith(color: palette.foreground),
      menuStyle: variantMenyStyle,
      inputDecorationTheme: variantTextInputStyle,
    );
  }
}

class _StandardUiDropDownMenuStyle extends MenuStyle {
  const _StandardUiDropDownMenuStyle({required this.palette});
  final ColorPalette palette;

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStatePropertyAll(palette.secondary);

  @override
  WidgetStateProperty<Color?>? get shadowColor =>
      WidgetStatePropertyAll(palette.foreground.withValues(alpha: 0.2));

  @override
  WidgetStateProperty<Color?>? get surfaceTintColor =>
      const WidgetStatePropertyAll<Color>(Colors.transparent);

  @override
  WidgetStateProperty<double?>? get elevation =>
      const WidgetStatePropertyAll(0);

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(.symmetric(horizontal: 8, vertical: 8));

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(100, 40));

  @override
  WidgetStateProperty<Size?>? get fixedSize =>
      const WidgetStatePropertyAll(.fromWidth(.infinity));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size.infinite);

  @override
  WidgetStateProperty<BorderSide?>? get side => WidgetStatePropertyAll(
    BorderSide(color: palette.secondaryForeground, width: 0.1),
  );

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: .all(.circular(12))),
      );

  @override
  WidgetStateProperty<MouseCursor?>? get mouseCursor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      });

  @override
  VisualDensity? get visualDensity => .adaptivePlatformDensity;

  @override
  AlignmentGeometry? get alignment => null;
}

InputDecorationTheme _buildInputDecorationTheme({
  required ColorPalette palette,
  required AppTypography typography,
}) {
  return InputDecorationTheme(
    isCollapsed: true,
    labelStyle: typography.bodyMedium.copyWith(
      color: palette.secondaryForeground,
    ),
    hintStyle: typography.bodyMedium.copyWith(
      color: palette.secondaryForeground,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: .circular(12),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: .circular(12),
      borderSide: BorderSide(color: palette.destructiveBorder, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: .circular(12),
      borderSide: BorderSide(color: palette.destructiveBorder, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: .circular(12),
      borderSide: BorderSide(color: Colors.transparent),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: .circular(12),
      borderSide: BorderSide(color: palette.foreground.withValues(alpha: .08)),
    ),
    fillColor: palette.secondary,
    filled: true,
    contentPadding: const .symmetric(horizontal: 16, vertical: 12),
    isDense: true,
  );
}

class _StandardMenuButtonStyle extends _UiBaseMenuButtonStyle {
  const _StandardMenuButtonStyle({
    required super.palette,
    required super.typography,
  });

  @override
  WidgetStateProperty<Color?>? get foregroundColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return palette.secondary.withValues(alpha: .38);
        }
        if (states.contains(WidgetState.pressed)) {
          return palette.primaryForeground;
        }
        return palette.foreground;
      });

  @override
  WidgetStateProperty<Color?>? get backgroundColor =>
      WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.pressed)) {
          return palette.primary;
        }
        return Colors.transparent;
      });

  @override
  WidgetStateProperty<Color?>? get overlayColor =>
      WidgetStateProperty.resolveWith((Set<WidgetState> states) {
        final color = palette.secondaryForeground;

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
  WidgetStateProperty<Color>? get shadowColor =>
      WidgetStatePropertyAll<Color>(palette.foreground.withValues(alpha: .18));
}

class _UiBaseMenuButtonStyle extends ButtonStyle {
  const _UiBaseMenuButtonStyle({
    required this.palette,
    required this.typography,
  });

  final ColorPalette palette;
  final AppTypography typography;

  @override
  AlignmentGeometry? get alignment => Alignment.center;

  @override
  Duration? get animationDuration => const Duration(milliseconds: 0);

  @override
  WidgetStateProperty<OutlinedBorder?>? get shape =>
      const WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: .all(.circular(8))),
      );

  @override
  MaterialTapTargetSize? get tapTargetSize => MaterialTapTargetSize.shrinkWrap;

  @override
  WidgetStateProperty<EdgeInsetsGeometry?>? get padding =>
      const WidgetStatePropertyAll(.symmetric(horizontal: 12, vertical: 8));

  @override
  WidgetStateProperty<Size?>? get minimumSize =>
      const WidgetStatePropertyAll(Size(100, 24));

  @override
  WidgetStateProperty<Size?>? get maximumSize =>
      const WidgetStatePropertyAll(Size.infinite);

  @override
  WidgetStateProperty<TextStyle?>? get textStyle =>
      WidgetStatePropertyAll(typography.bodyMedium);

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
      const WidgetStatePropertyAll<double>(8.0);
}
