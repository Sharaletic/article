import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../author.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key, required this.cubit});
  final AuthorFormCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthorFormCubit, AuthorFormState, List<PostFieldState>>(
      selector: (state) => state.posts!,
      builder: (context, posts) {
        return Align(
          alignment: .centerLeft,
          child: UiButton.text(
            icon: Icon(Icons.hdr_plus),
            label: const Text('Добавить должность'),
            style: TextButton.styleFrom(
              minimumSize: .zero,
              padding: .zero,
              tapTargetSize: .shrinkWrap,
            ),
            onPressed: () => cubit.addEmptyPost(),
            enabled: posts.length < 3,
          ),
        );
      },
    );
  }
}
