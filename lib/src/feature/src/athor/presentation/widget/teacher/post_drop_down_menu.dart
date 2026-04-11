import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../author.dart';

class PostDropDownMenu extends StatelessWidget {
  const PostDropDownMenu({super.key, required this.postCounter});
  final PostCounter postCounter;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: postCounter.postCount,
      builder: (_, value, _) {
        return Column(
          children: List.generate(
            value,
            (index) => Column(
              children: [
                UiDropDownMenu.standard(
                  hintText: 'Выберите должность',
                  requestFocusOnTap: false,
                  dropdownMenuEntries: Post.values,
                  itemLabelMenuBuilder: (el) => el.value,
                  itemValueMenuBuilder: (el) => el,
                  onSelected: context.read<AuthorFormCubit>().postChanged,
                ),
                index != value - 1
                    ? const SizedBox(height: 8)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
