import 'package:ui_kit/ui_kit.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return Column(
      crossAxisAlignment: .start,
      children: [
        UiText.displaySmall(
          'Начните использовать',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        UiText.displaySmall(
          'Article',
          color: palette.primary,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 16),
        UiText.titleSmall('Введите свою информацию\nдля входа в систему'),
      ],
    );
  }
}
