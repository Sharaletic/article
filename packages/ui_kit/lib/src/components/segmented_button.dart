import 'package:ui_kit/ui_kit.dart';

class UiSegmentedButton<T> extends StatelessWidget {
  const UiSegmentedButton({
    required this.selected,
    required this.onSelected,
    required this.items,
    this.itemLabelBuilder,
    this.itemIconBuilder,
    super.key,
  });
  final T selected;
  final ValueChanged<T> onSelected;
  final List<T> items;
  final Widget Function(T)? itemLabelBuilder;
  final Widget Function(T)? itemIconBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorPalette;
    final typography = theme.appTypography;

    return Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: const .all(.circular(16.0)),
      ),
      padding: const .all(4.0),
      child: Row(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isSelected = item == selected;
          final label = itemLabelBuilder?.call(item);
          final icon = itemIconBuilder?.call(item);
          return Expanded(
            child: UiButton.filledPrimary(
              onPressed: () => onSelected(item),
              label: label,
              icon: icon,
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                  .symmetric(horizontal: 4.0, vertical: 4.0),
                ),
                backgroundColor: isSelected
                    ? WidgetStatePropertyAll(colors.background)
                    : const WidgetStatePropertyAll(Colors.transparent),
                textStyle: WidgetStatePropertyAll(
                  typography.titleSmall.copyWith(fontWeight: .w600),
                ),
                foregroundColor: WidgetStatePropertyAll(colors.foreground),
              ),
            ),
          );
        }),
      ),
    );
  }
}
