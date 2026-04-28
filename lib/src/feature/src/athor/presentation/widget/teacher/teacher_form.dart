import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../../authentication/authentication.dart';
import '../../../author.dart';

class PostFieldState {
  PostFieldState(this.selectedPost) : id = UniqueKey().toString();
  final String id;
  final Post? selectedPost;
}

class PostCounter {
  PostCounter(this.authorFormCubit);
  final AuthorFormCubit? authorFormCubit;

  final ValueNotifier<List<PostFieldState>> _posts =
      ValueNotifier<List<PostFieldState>>([PostFieldState(null)]);

  ValueNotifier<List<PostFieldState>> get posts => _posts;

  void removePost(int index) {
    if (index != 0) {
      var newList = List<PostFieldState>.from(_posts.value)..removeAt(index);
      _posts.value = newList;

      authorFormCubit?.postChanged(
        _posts.value
            .where((postOrNull) => postOrNull.selectedPost != null)
            .map((e) => e.selectedPost!)
            .toList(),
      );
    }
  }

  void addEmptyPost() {
    _posts.value = [..._posts.value, PostFieldState(null)];
  }

  void updatePost(Post? post, int index) {
    var newList = List<PostFieldState>.from(_posts.value);
    newList[index] = PostFieldState(post);

    _posts.value = newList;
    _notifyCubit();
  }

  void _notifyCubit() {
    authorFormCubit?.postChanged(
      _posts.value
          .where((postOrNull) => postOrNull.selectedPost != null)
          .map((post) => post.selectedPost!)
          .toList(),
    );
  }
}

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  late final AuthorFormCubit _authorFormCubit;
  late final PostCounter postCounter;

  @override
  void initState() {
    super.initState();
    _authorFormCubit = context.read<AuthorFormCubit>();
    postCounter = PostCounter(_authorFormCubit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) => state.mapOrNull(
        successfull: (authState) {
          if (_authorFormCubit.state.status == AuthorStatus.teacher) {
            final formState = context.read<AuthorFormCubit>().state;
            AuthorEntity author = _createAuthor(authState, formState);
            _authorFormCubit.submit(author: author);
          }
        },
      ),
      child: BlocConsumer<AuthorFormCubit, AuthorFormState>(
        bloc: _authorFormCubit,
        listener: (context, state) {
          if (state.isSuccess) {
            context.router.replace(NamedRoute('AddInformationRoute'));
          }
        },
        builder: (context, state) => Column(
          crossAxisAlignment: .stretch,
          mainAxisSize: .min,
          children: [
            UiText.titleMedium('Фамилия', style: TextStyle(fontWeight: .w600)),
            const SizedBox(height: 8),
            UiTextField.standard(
              style: UiTextFieldStyle(hintText: 'Фамилия на русском'),
              onChanged: _authorFormCubit.lastNameRuChanged,
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              style: UiTextFieldStyle(hintText: 'Фамилия на английском'),
              onChanged: _authorFormCubit.lastNameEnChanged,
            ),
            const SizedBox(height: 16),
            UiText.titleMedium('Имя', style: TextStyle(fontWeight: .w600)),
            const SizedBox(height: 8),
            UiTextField.standard(
              style: UiTextFieldStyle(hintText: 'Имя на русском'),
              onChanged: _authorFormCubit.firstNameRuChanged,
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              style: UiTextFieldStyle(hintText: 'Имя на английском'),
              onChanged: _authorFormCubit.firstNameEnChanged,
            ),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Отчество (необязательно)',
              style: TextStyle(fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              style: UiTextFieldStyle(hintText: 'Отчество на русском'),
              onChanged: _authorFormCubit.middleNameRuChanged,
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              style: UiTextFieldStyle(hintText: 'Отчество на английском'),
              onChanged: _authorFormCubit.middleNameEnChanged,
            ),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Организация',
              style: TextStyle(fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            OrganizationDropDownMenu(authorFormCubit: _authorFormCubit),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Должность',
              style: TextStyle(fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            PostDropDownMenus(postCounter: postCounter),
            const SizedBox(height: 8),
            AddPostButton(postCounter: postCounter),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Ученная степень',
              style: TextStyle(fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            UiDropDownMenu.standard(
              hintText: 'Выберите степень',
              requestFocusOnTap: false,
              dropdownMenuEntries: AcademicDegree.values,
              itemLabelMenuBuilder: (el) => el.value,
              itemValueMenuBuilder: (el) => el,
              onSelected: _authorFormCubit.academicDegree,
            ),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Ученное звание',
              style: TextStyle(fontWeight: .w600),
            ),
            const SizedBox(height: 8),
            UiDropDownMenu.standard(
              hintText: 'Выберите звание',
              requestFocusOnTap: false,
              dropdownMenuEntries: AcademicTitle.values,
              itemLabelMenuBuilder: (el) => el.value,
              itemValueMenuBuilder: (el) => el,
              onSelected: _authorFormCubit.academicTitle,
            ),
            const SizedBox(height: 88),
            AddInformationButton(state: state),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  AuthorEntity _createAuthor(
    AuthenticationState authState,
    AuthorFormState formState,
  ) {
    final author = AuthorEntity(
      user: authState.user as AuthenticatedUser,
      status: AuthorStatus.student,
      lastNameRu: formState.lastNameRu,
      lastNameEn: formState.lastNameEn,
      firstNameRu: formState.firstNameRu,
      firstNameEn: formState.firstNameEn,
      middleNameRu: formState.middleNameRu,
      middleNameEn: formState.middleNameEn,
      organization: formState.organization!,
      educationLevel: null,
      posts: formState.posts,
      academicDegree: formState.academicDegree,
      academicTitle: formState.academicTitle,
    );
    return author;
  }
}
