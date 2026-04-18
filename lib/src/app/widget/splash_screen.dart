import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../core/core.dart';
import '../../feature/src/authentication/authentication.dart';
import '../app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final AppRouter router;

  @override
  void initState() {
    super.initState();
    router = DependenciesScope.of(context).router;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.mapOrNull(
          authenticated: (state) => router.replace(NamedRoute('HomeRoute')),
          notAuthenticated: (state) => router.replace(NamedRoute('AuthRoute')),
          error: (state) => ErrorUtil.displayErrorSnackBar(
            context,
            state.error,
            state.stackTrace,
          ),
        );
      },
      child: const Scaffold(body: Center(child: UiText('Splash Screen'))),
    );
  }
}
