import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../authentication.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  late final AuthenticationBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = context.read<AuthenticationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      child: UiButton.filledPrimary(
        label: const Text('Войти'),
        onPressed: () => _authBloc.add(
          AuthenticationEvent.login(
            email: widget.emailController.text,
            password: widget.passwordController.text,
          ),
        ),
      ),
    );
  }
}
