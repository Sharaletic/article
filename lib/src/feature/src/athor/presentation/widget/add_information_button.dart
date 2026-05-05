import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

class AddInformationButton extends StatelessWidget {
  const AddInformationButton({super.key, required this.authorFormCubit});
  final AuthorFormCubit authorFormCubit;

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<AuthorFormCubit, AuthorFormState>(
        builder: (context, state) => UiButton.filledPrimary(
          onPressed: () {
            authorFormCubit.setSubmiting(isSubmitting: true);
            context.read<AuthenticationBloc>().add(
              AuthenticationEvent.updateDisplayName(
                name: _createDisplayName(authorFormCubit.state),
              ),
            );
          },
          label: authorFormCubit.state.isSubmitting
              ? SizedBox.square(
                  dimension: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(
                      context,
                    ).colorPalette.primary.withValues(alpha: .38),
                  ),
                )
              : const Text('Добавить'),
          enabled:
              authorFormCubit.state.canStudentSubmit ||
              authorFormCubit.state.canTeacherSubmit,
        ),
      );

  String _createDisplayName(AuthorFormState state) {
    var displayName = [
      state.lastNameRu,
      state.firstNameRu,
      state.middleNameRu,
    ].whereType<String>().where((name) => name.trim().isNotEmpty).join(' ');
    return displayName;
  }
}
