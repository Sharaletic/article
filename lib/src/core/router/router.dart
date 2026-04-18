import 'package:auto_route/auto_route.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../app/widget/splash_screen.dart';
import '../../feature/src/athor/author.dart';
import '../../feature/src/authentication/authentication.dart';
import '../../feature/src/navigation/navigation.dart';

class AppRouter extends RootStackRouter {
  AppRouter();

  static const List<NestedRoute> nestedRoutes = [
    NestedRoute(
      name: 'HomeRoute',
      title: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    NestedRoute(
      name: 'ArticleRoute',
      title: 'Article',
      icon: Icons.article_outlined,
      activeIcon: Icons.article,
    ),
    NestedRoute(
      name: 'HistoryRoute',
      title: 'History',
      icon: Icons.history_outlined,
      activeIcon: Icons.history,
    ),
    NestedRoute(
      name: 'ProfileRoute',
      title: 'Profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person,
    ),
  ];

  @override
  List<AutoRoute> get routes => [
    NamedRouteDef(
      name: 'SplashRoute',
      initial: true,
      builder: (_, _) => const SplashScreen(),
    ),

    NamedRouteDef(name: 'AuthRoute', builder: (_, _) => const Auth()),

    NamedRouteDef(
      name: 'AddInformationRoute',
      builder: (_, _) => const AddInformation(),
    ),

    NamedRouteDef(
      name: 'RootRoute',
      builder: (_, _) => const RootScreen(nestedRoutes: nestedRoutes),
      children: [
        NamedRouteDef(
          name: 'HomeRoute',
          initial: true,
          builder: (_, _) => const AddInformation(),
        ),
        NamedRouteDef(
          name: 'ArticleRoute',
          builder: (_, _) => const AddInformation(),
        ),
        NamedRouteDef(
          name: 'HistoryRoute',
          builder: (_, _) => const AddInformation(),
        ),
        NamedRouteDef(
          name: 'ProfileRoute',
          builder: (_, _) => const AddInformation(),
        ),
      ],
    ),
  ];
}
