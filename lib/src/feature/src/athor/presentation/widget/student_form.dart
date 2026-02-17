import 'package:ui_kit/ui_kit.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _lastNameRuController = TextEditingController();
  final _lastNameEnController = TextEditingController();
  final _firstNameRuController = TextEditingController();
  final _firstNameEnController = TextEditingController();
  final _middleNameRuController = TextEditingController();
  final _middleNameEnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        UiText.titleMedium(
          'Фамилия',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _lastNameRuController,
          style: UiTextFieldStyle(hintText: 'Фамилия на русском'),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _lastNameEnController,
          style: UiTextFieldStyle(hintText: 'Фамилия на английском'),
        ),
        const SizedBox(height: 16),
        UiText.titleMedium(
          'Имя',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _firstNameRuController,
          style: UiTextFieldStyle(hintText: 'Имя на русском'),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _firstNameEnController,
          style: UiTextFieldStyle(hintText: 'Имя на английском'),
        ),
        const SizedBox(height: 16),
        UiText.titleMedium(
          'Отчество (необязательно)',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _middleNameRuController,
          style: UiTextFieldStyle(hintText: 'Отчество на русском'),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          controller: _middleNameEnController,
          style: UiTextFieldStyle(hintText: 'Отчество на английском'),
        ),
      ],
    );
  }
}
