import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

class AddInformationButton extends StatelessWidget {
  const AddInformationButton({super.key, required this.state});
  final AuthorFormState state;

  @override
  Widget build(BuildContext context) {
    return UiButton.filledPrimary(
      onPressed: () => state.canSubmit
          ? context.read<AuthenticationBloc>().add(
              AuthenticationEvent.updateDisplayName(
                name: _createDisplayName(state),
              ),
            )
          : null,
      label: const Text('Добавить'),
      enabled: state.canSubmit,
    );
  }

  String _createDisplayName(AuthorFormState state) {
    return '${state.lastNameRu} ${state.firstNameRu} ${state.middleNameRu}'
        .trim();
  }
}
