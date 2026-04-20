import 'package:auto_route/auto_route.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../app/widget/splash_screen.dart';
import '../../feature/src/athor/author.dart';
import '../../feature/src/authentication/authentication.dart';
import '../../feature/src/navigation/navigation.dart';

class AppRouter extends RootStackRouter {
  AppRouter();

  static const List<NestedRoute> nestedRoutes = [
    NestedRoute(name: 'HomeRoute', title: 'Главная', icon: ArticleIcons.home),
    NestedRoute(
      name: 'ArticleRoute',
      title: 'Статья',
      icon: ArticleIcons.article,
    ),
    NestedRoute(
      name: 'HistoryRoute',
      title: 'История',
      icon: ArticleIcons.history,
    ),
    NestedRoute(
      name: 'ProfileRoute',
      title: 'Профиль',
      icon: ArticleIcons.person,
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
