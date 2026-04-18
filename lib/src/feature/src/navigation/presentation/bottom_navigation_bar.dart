import 'package:auto_route/auto_route.dart';
import 'package:ui_kit/ui_kit.dart';

class NestedRoute {
  const NestedRoute({
    required this.name,
    required this.title,
    required this.icon,
    required this.activeIcon,
  });

  final String name;
  final String title;
  final IconData icon;
  final IconData activeIcon;
}

class NavigationPanel extends StatelessWidget {
  const NavigationPanel({super.key, required this.nestedRoutes});
  final List<NestedRoute> nestedRoutes;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 80.0,
    child: Row(
      mainAxisAlignment: .spaceEvenly,
      crossAxisAlignment: .center,
      children: List.generate(nestedRoutes.length, (index) {
        final page = nestedRoutes[index];
        return TabItem(
          index: index,
          title: page.title,
          icon: page.icon,
          activeIcon: page.activeIcon,
        );
      }),
    ),
  );
}

class TabItem extends StatefulWidget {
  const TabItem({
    super.key,
    required this.index,
    required this.title,
    required this.icon,
    required this.activeIcon,
  });

  final int index;
  final String title;
  final IconData icon;
  final IconData activeIcon;

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
    final colorPalette = Theme.of(context).colorPalette;
    return GestureDetector(
      onTap: () => AutoTabsRouter.of(context).setActiveIndex(widget.index),
      child: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Icon(
            _isActive ? widget.activeIcon : widget.icon,
            color: _isActive
                ? colorPalette.foreground
                : colorPalette.mutedForeground,
          ),
          UiText.bodySmall(
            widget.title,
            color: _isActive
                ? colorPalette.foreground
                : colorPalette.mutedForeground,
          ),
        ],
      ),
    );
  }
}
