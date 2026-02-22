import 'package:ui_kit/ui_kit.dart';

enum SegmentedItem {
  firstSegment('1st segment', Icon(Icons.book)),
  secondSegment('2nd segment', Icon(Icons.house));

  const SegmentedItem(this.value, this.icon);
  final String value;
  final Icon icon;
}

class SegmentedButtonPreview extends StatefulWidget {
  const SegmentedButtonPreview({super.key});

  @override
  State<SegmentedButtonPreview> createState() => _SegmentedButtonPreviewState();
}

class _SegmentedButtonPreviewState extends State<SegmentedButtonPreview> {
  var selectedSegment = SegmentedItem.firstSegment;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return UiCard(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UiSegmentedButton(
              selected: selectedSegment,
              onSelected: (selected) {
                setState(() {
                  selectedSegment = selected;
                });
              },
              items: SegmentedItem.values,
              itemLabelBuilder: (segment) => UiText.titleSmall(segment.value),
              itemIconBuilder: (segment) =>
                  Icon(segment.icon.icon, color: palette.secondaryForeground),
            ),
          ],
        ),
      ),
    );
  }
}
