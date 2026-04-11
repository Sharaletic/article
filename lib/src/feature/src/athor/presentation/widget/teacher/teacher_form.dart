import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../../authentication/authentication.dart';
import '../../../author.dart';

class PostCounter {
  final ValueNotifier<int> _postCount = ValueNotifier<int>(1);
  ValueNotifier<int> get postCount => _postCount;
  void increment() => _postCount.value++;
}

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  late final AuthorFormCubit _authorFormCubit;
  PostCounter postCounter = PostCounter();

  @override
  void initState() {
    super.initState();
    _authorFormCubit = context.read<AuthorFormCubit>();
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
          if (state.isSuccess) {}
        },
        builder: (context, state) => Padding(
          padding: const .symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: .stretch,
            mainAxisSize: .min,
            children: [
              UiText.titleMedium(
                'Фамилия',
                style: TextStyle(fontWeight: .w600),
              ),
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
              PostDropDownMenu(postCounter: postCounter),
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
