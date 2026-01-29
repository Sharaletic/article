import 'package:arcticle_app/src/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../authentication.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  late final AuthenticationBloc _authBloc;

  @override
  void initState() {
    _authBloc = DependenciesScope.of(context).authenticationBloc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          state.mapOrNull(successfull: (_) => {}, error: (_) => {});
        },
        child: UiButton.filledPrimary(
          label: const Text('Зарегистрироваться'),
          onPressed: () => _authBloc.add(
            AuthenticationEvent.signup(
              email: widget.emailController.text,
              password: widget.passwordController.text,
              role: UserRole.author,
            ),
          ),
        ),
      ),
    );
  }
}
