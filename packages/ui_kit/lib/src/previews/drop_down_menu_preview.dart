import 'package:ui_kit/ui_kit.dart';

class DropDownMenuPreview extends StatelessWidget {
  const DropDownMenuPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiCard(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UiDropDownMenu.standard(
              hintText: 'Hint Text',
              dropdownMenuEntries: [
                Item('Item 1'),
                Item('Item 2'),
                Item('Item 3'),
              ],
              expandedInsets: EdgeInsets.zero,
              itemLabelMenuBuilder: (item) => item.title,
              itemValueMenuBuilder: (item) => item,
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  const Item(this.title);
  final String title;
}
