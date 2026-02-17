import 'package:ui_kit/ui_kit.dart';

class UiSegmentedButton extends StatefulWidget {
  const UiSegmentedButton({
    required this.onSelected,
    required this.items,
    super.key,
  });

  final ValueChanged<String> onSelected;
  final List<String> items;

  @override
  State<UiSegmentedButton> createState() => _UiSegmentedButtonState();
}

class _UiSegmentedButtonState extends State<UiSegmentedButton> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorPalette;
    final typography = theme.appTypography;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorPalette.secondary,
        borderRadius: const .all(.circular(16.0)),
      ),
      padding: const .all(4.0),
      child: Row(
        children: [
          for (int i = 0; i < widget.items.length; i++)
            Expanded(
              child: UiButton.filledPrimary(
                onPressed: () {
                  setState(() {
                    _selectedIndex = i;
                    widget.onSelected(widget.items[i]);
                  });
                },
                label: Text(widget.items[i]),
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                    .symmetric(horizontal: 4.0, vertical: 4.0),
                  ),
                  backgroundColor: i == _selectedIndex
                      ? WidgetStatePropertyAll(colors.background)
                      : const WidgetStatePropertyAll(Colors.transparent),
                  textStyle: WidgetStatePropertyAll(
                    typography.titleSmall.copyWith(fontWeight: .w600),
                  ),
                  foregroundColor: WidgetStatePropertyAll(colors.foreground),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
