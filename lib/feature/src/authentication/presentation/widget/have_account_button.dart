import 'package:ui_kit/ui_kit.dart';
import '../../authentication.dart';

class HaveAccountButton extends StatelessWidget {
  const HaveAccountButton({
    super.key,
    required this.authType,
    required this.onPressed,
  });
  final AuthType authType;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UiText.titleSmall(
          authType == AuthType.login ? 'Нет аккаунта?' : 'Есть аккаунт?',
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: UiText.titleSmall(
            authType == AuthType.login ? 'Зарегистрируйтесь' : 'Войдите',
            color: palette.primary,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
