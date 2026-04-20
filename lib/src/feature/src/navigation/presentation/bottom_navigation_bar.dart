import 'package:auto_route/auto_route.dart';
import 'package:ui_kit/ui_kit.dart';

class NestedRoute {
  const NestedRoute({
    required this.name,
    required this.title,
    required this.icon,
  });

  final String name;
  final String title;
  final IconData icon;
}

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key, required this.nestedRoutes});
  final List<NestedRoute> nestedRoutes;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: palette.background,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            color: palette.secondary,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: .spaceEvenly,
        crossAxisAlignment: .center,
        children: List.generate(nestedRoutes.length, (index) {
          final page = nestedRoutes[index];
          return TabItem(index: index, title: page.title, icon: page.icon);
        }),
      ),
    );
  }
}

class TabItem extends StatefulWidget {
  const TabItem({
    super.key,
    required this.index,
    required this.title,
    required this.icon,
  });

  final int index;
  final String title;
  final IconData icon;

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  bool _isActive = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _isActive =
        AutoTabsRouter.of(context, watch: true).activeIndex == widget.index;
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return GestureDetector(
      onTap: () => AutoTabsRouter.of(context).setActiveIndex(widget.index),
      child: Column(
        crossAxisAlignment: .center,
        children: [
          const SizedBox(height: 12),
          Icon(
            widget.icon,
            color: _isActive ? palette.primary : palette.foreground,
          ),
          const SizedBox(height: 4),
          UiText.bodySmall(
            widget.title,
            color: _isActive ? palette.primary : palette.foreground,
            style: TextStyle(fontWeight: .w600),
          ),
        ],
      ),
    );
  }
}
