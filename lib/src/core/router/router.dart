import 'package:arcticle_app/src/feature/src/athor/author.dart';
import 'package:auto_route/auto_route.dart';
import '../../feature/src/authentication/authentication.dart';

class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    .named('AuthRoute', initial: true, (context, data) => const Auth()),
    .named('AddInformationRoute', (context, data) => const AddInformation()),

    // AutoRoute(
    //   path: '/dashboard',
    //   page: DashboardRoute.page,
    //   children: [
    //     .named('HomeRoute', (context, data) => const AddInformation()),
    //     .named('ArticleRoute', (context, data) => const AddInformation()),
    //     .named('HistoryRoute', (context, data) => const AddInformation()),
    //     .named('ProfileRoute', (context, data) => const AddInformation(v)),
    //   ],
    // ),
  ];
}
