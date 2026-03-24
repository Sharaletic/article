import 'package:ui_kit/ui_kit.dart';

class AddInformationButton extends StatelessWidget {
  const AddInformationButton({super.key, required this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return UiButton.filledPrimary(
      onPressed: onPressed,
      label: const Text('Добавить'),
    );
  }
}
