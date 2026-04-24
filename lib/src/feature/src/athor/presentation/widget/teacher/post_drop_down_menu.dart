import 'package:ui_kit/ui_kit.dart';
import '../../../author.dart';

class PostDropDownMenus extends StatelessWidget {
  const PostDropDownMenus({super.key, required this.postCounter});
  final PostCounter postCounter;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: postCounter.posts,
      builder: (_, value, _) {
        return Column(
          children: [
            for (int i = 0; i < value.length; i++) ...[
              Row(
                key: ValueKey(value[i].id),
                children: [
                  Expanded(
                    child: PostDropDownMenu(
                      postCounter,
                      value[i].selectedPost,
                      i,
                    ),
                  ),
                  if (i != 0)
                    UiButton.icon(
                      onPressed: () => postCounter.removePost(i),
                      icon: Icon(Icons.close),
                    ),
                ],
              ),
              if (i != value.length - 1) const SizedBox(height: 8),
            ],
          ],
        );
      },
    );
  }
}

class PostDropDownMenu extends StatelessWidget {
  const PostDropDownMenu(
    this.postCounter,
    this.currentValue,
    this.index, {
    super.key,
  });
  final PostCounter postCounter;
  final Post? currentValue;
  final int index;

  @override
  Widget build(BuildContext context) {
    return UiDropDownMenu.standard(
      initialSelection: currentValue,
      hintText: 'Выберите должность',
      requestFocusOnTap: false,
      dropdownMenuEntries: Post.values,
      itemLabelMenuBuilder: (el) => el.value,
      itemValueMenuBuilder: (el) => el,
      // onSelected: context.read<AuthorFormCubit>().postChangedByAdd,
      onSelected: (value) => postCounter.updatePost(value, index),
    );
  }
}
