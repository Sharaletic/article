import 'package:auto_route/auto_route.dart';
import 'package:ui_kit/ui_kit.dart';
import '../navigation.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.nestedRoutes});
  final List<NestedRoute> nestedRoutes;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return AutoTabsRouter(
      duration: Duration(milliseconds: 900),
      lazyLoad: true,
      homeIndex: 0,
      routes: List.generate(
        nestedRoutes.length,
        (index) => NamedRoute(nestedRoutes[index].name),
      ),
      builder: (context, child) => Scaffold(
        backgroundColor: palette.background,
        body: child,
        bottomNavigationBar: NavigationPanel(nestedRoutes: nestedRoutes),
      ),
    );
  }
}
