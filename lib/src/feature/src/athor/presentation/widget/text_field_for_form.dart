import 'package:arcticle_app/src/feature/src/athor/author.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class TextFieldForForm extends StatelessWidget {
  const TextFieldForForm({
    super.key,
    required this.title,
    required this.onChanged,
    required this.selector,
  });
  final String title;
  final void Function(String value) onChanged;
  final String? Function(AuthorFormState state) selector;

  @override
  Widget build(BuildContext context) =>
      BlocSelector<AuthorFormCubit, AuthorFormState, String?>(
        selector: selector,
        builder: (context, state) => UiTextField.standard(
          style: UiTextFieldStyle(hintText: title),
          onChanged: onChanged,
        ),
      );
}
