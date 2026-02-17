import 'package:ui_kit/ui_kit.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return Align(
      alignment: .centerRight,
      child: UiButton.text(
        onPressed: () {},
        label: UiText.titleSmall(
          'Забыли пароль?',
          color: palette.primary,
          style: TextStyle(fontWeight: .w600),
        ),
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
    );
  }
}
