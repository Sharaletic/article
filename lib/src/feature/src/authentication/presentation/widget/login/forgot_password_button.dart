import 'package:ui_kit/ui_kit.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: UiButton.text(
        onPressed: () {},
        label: const Text('Забыль пароль?'),
      ),
    );
  }
}
