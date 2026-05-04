import 'package:ui_kit/ui_kit.dart';

class RequestHeader extends StatelessWidget {
  const RequestHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      children: [
        UiText.displaySmall(
          'Отправьте статью',
          style: TextStyle(fontWeight: .w800),
        ),
        const SizedBox(height: 12),
        UiText.titleSmall('Заполните данные и загрузите файл'),
      ],
    );
  }
}
