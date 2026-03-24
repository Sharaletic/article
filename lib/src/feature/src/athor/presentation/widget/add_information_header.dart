import 'package:ui_kit/ui_kit.dart';

class AddInformationHeader extends StatelessWidget {
  const AddInformationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisSize: .min,
        children: [
          UiText.displaySmall(
            'Добавьте\nинформацию\nо себе',
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 16),
          UiText.titleSmall(
            'Пожалуйста, предоставьте свою\nинформацию, чтобы персонализировать\nсвой академический опыт',
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
