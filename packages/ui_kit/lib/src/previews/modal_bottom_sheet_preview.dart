import 'package:ui_kit/ui_kit.dart';

class ModalBottomSheetPreview extends StatelessWidget {
  const ModalBottomSheetPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return UiCard(
      child: Padding(
        padding: .all(16),
        child: UiButton.filledPrimary(
          label: const Text('Show Modal Bottom Sheet'),
          onPressed: () => showUiModalBottomSheet(
            context: context,
            builder: (_) => UiModalBottomSheet(
              title:
                  'Название модального окна с длинным текстом для проверки переноса',
              content: Column(
                children: [
                  UiText.titleMedium('UiText.titleMedium'),
                  const UiTextField.standard(
                    style: UiTextFieldStyle(hintText: 'Text input'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
