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
      mainAxisAlignment: .center,
      children: [
        UiText.titleSmall(
          authType == .login ? 'Нет аккаунта?' : 'Есть аккаунт?',
        ),
        const SizedBox(width: 4),
        TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            minimumSize: .zero,
            padding: .zero,
            tapTargetSize: .shrinkWrap,
          ),
          child: UiText.titleSmall(
            authType == .login ? 'Зарегистрируйтесь' : 'Войдите',
            color: palette.primary,
            style: TextStyle(fontWeight: .w600),
          ),
        ),
      ],
    );
  }
}
