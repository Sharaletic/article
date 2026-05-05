import 'package:arcticle_app/src/feature/src/athor/author.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class EducationLevelDropDownMenu extends StatelessWidget {
  const EducationLevelDropDownMenu({super.key, required this.onSelected});
  final void Function(EducationLevel? value) onSelected;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthorFormCubit, AuthorFormState, EducationLevel>(
      selector: (state) => state.educationLevel ?? EducationLevel.bachelor,
      builder: (context, state) => UiDropDownMenu.standard(
        hintText: 'Выберите курс',
        requestFocusOnTap: false,
        dropdownMenuEntries: EducationLevel.values,
        itemLabelMenuBuilder: (el) => el.value,
        itemValueMenuBuilder: (el) => el,
        onSelected: onSelected,
      ),
    );
  }
}
