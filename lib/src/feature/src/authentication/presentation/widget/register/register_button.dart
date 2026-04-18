import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../../../../core/core.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.mapOrNull(
          authenticated: (_) =>
              context.router.replace(NamedRoute('AddInformationRoute')),
          error: (state) => ErrorUtil.displayErrorSnackBar(
            context,
            state.error,
            state.stackTrace,
          ),
        );
      },
      child: UiButton.filledPrimary(
        label: const Text('Зарегистрироваться'),
        onPressed: () => context.read<AuthenticationBloc>().add(
          AuthenticationEvent.signup(
            email: widget.emailController.text,
            password: widget.passwordController.text,
          ),
        ),
      ),
    );
  }
}
