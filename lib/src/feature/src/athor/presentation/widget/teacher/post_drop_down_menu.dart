import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../author.dart';

class PostDropDownMenus extends StatefulWidget {
  const PostDropDownMenus({super.key, required this.cubit});
  final AuthorFormCubit cubit;

  @override
  State<PostDropDownMenus> createState() => _PostDropDownMenusState();
}

class _PostDropDownMenusState extends State<PostDropDownMenus> {
  @override
  void initState() {
    super.initState();
    widget.cubit.addEmptyPost();
  }

  @override
  Widget build(BuildContext context) =>
      BlocSelector<AuthorFormCubit, AuthorFormState, List<PostFieldState>?>(
        selector: (state) => state.posts,
        builder: (context, posts) {
          return Column(
            children: [
              for (int i = 0; i < posts!.length; i++) ...[
                Row(
                  key: ValueKey(posts[i].id),
                  children: [
                    Expanded(
                      child: PostDropDownMenu(
                        widget.cubit,
                        posts[i].selectedPost,
                        i,
                      ),
                    ),
                    if (i != 0)
                      UiButton.icon(
                        onPressed: () => widget.cubit.removePost(i),
                        icon: Icon(Icons.close),
                      ),
                  ],
                ),
                if (i != posts.length - 1) const SizedBox(height: 8),
              ],
            ],
          );
        },
      );
}

class PostDropDownMenu extends StatelessWidget {
  const PostDropDownMenu(this.cubit, this.currentPost, this.index, {super.key});
  final AuthorFormCubit cubit;
  final Post? currentPost;
  final int index;

  @override
  Widget build(BuildContext context) => UiDropDownMenu.standard(
    initialSelection: currentPost,
    hintText: 'Выберите должность',
    requestFocusOnTap: false,
    dropdownMenuEntries: Post.values,
    itemLabelMenuBuilder: (el) => el.value,
    itemValueMenuBuilder: (el) => el,
    onSelected: (value) => cubit.updatePost(value, index),
  );
}
