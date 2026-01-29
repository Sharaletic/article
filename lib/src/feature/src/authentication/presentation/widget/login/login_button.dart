import 'package:ui_kit/ui_kit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return UiButton.filledPrimary(
      label: const Text('Войти'),
      onPressed: () {},
    );
  }
}
