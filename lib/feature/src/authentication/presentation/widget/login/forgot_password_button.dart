import 'package:ui_kit/ui_kit.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: UiText.titleSmall(
          'Забыль пароль?',
          color: palette.primary,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
