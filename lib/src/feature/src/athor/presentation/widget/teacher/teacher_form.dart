import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../../authentication/authentication.dart';
import '../../../author.dart';

class TeacherForm extends StatefulWidget {
  const TeacherForm({super.key});

  @override
  State<TeacherForm> createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  late final AuthorFormCubit _authorFormCubit;

  @override
  void initState() {
    super.initState();
    _authorFormCubit = context.read<AuthorFormCubit>();
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
    listeners: [
      BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) => state.mapOrNull(
          successfull: (state) {
            if (_authorFormCubit.state.isSubmitting &&
                _authorFormCubit.state.status == .teacher) {
              final author = _createAuthor(state.user, _authorFormCubit.state);
              context.read<AuthorBloc>().add(.createAuthor(author: author));
            }
          },
          error: (_) =>
              _authorFormCubit.setError('Ошибка при обновлении имени'),
        ),
      ),
      BlocListener<AuthorBloc, AuthorState>(
        listener: (context, state) => state.mapOrNull(
          createdAthor: (_) {
            if (_authorFormCubit.state.status == .teacher) {
              _authorFormCubit.setSuccess();
            }
          },
          error: (_) => _authorFormCubit.setError('Ошибка при создании автора'),
        ),
      ),
    ],
    child: BlocListener<AuthorFormCubit, AuthorFormState>(
      bloc: _authorFormCubit,
      listener: (context, state) {
        if (state.isSuccess && state.status == .teacher) {
          context.router.replace(NamedRoute('AddInformationRoute'));
        }
      },
      child: Column(
        crossAxisAlignment: .stretch,
        mainAxisSize: .min,
        children: [
          UiText.titleMedium('Фамилия', style: TextStyle(fontWeight: .w600)),
          const SizedBox(height: 8),
          TextFieldForForm(
            title: 'Фамилия на русском',
            onChanged: _authorFormCubit.lastNameRuChanged,
            selector: (state) => state.lastNameRu,
          ),
          const SizedBox(height: 8),
          TextFieldForForm(
            title: 'Фамилия на английском',
            onChanged: _authorFormCubit.lastNameEnChanged,
            selector: (state) => state.lastNameEn,
          ),
          const SizedBox(height: 16),
          UiText.titleMedium('Имя', style: TextStyle(fontWeight: .w600)),
          const SizedBox(height: 8),
          TextFieldForForm(
            title: 'Имя на русском',
            onChanged: _authorFormCubit.firstNameRuChanged,
            selector: (state) => state.firstNameRu,
          ),
          const SizedBox(height: 8),
          TextFieldForForm(
            title: 'Имя на английском',
            onChanged: _authorFormCubit.firstNameEnChanged,
            selector: (state) => state.firstNameEn,
          ),
          const SizedBox(height: 16),
          UiText.titleMedium(
            'Отчество (необязательно)',
            style: TextStyle(fontWeight: .w600),
          ),
          const SizedBox(height: 8),
          TextFieldForForm(
            title: 'Отчество на русском',
            onChanged: _authorFormCubit.middleNameRuChanged,
            selector: (state) => state.middleNameRu,
          ),
          const SizedBox(height: 8),
          TextFieldForForm(
            title: 'Отчество на английском',
            onChanged: _authorFormCubit.middleNameEnChanged,
            selector: (state) => state.middleNameEn,
          ),
          const SizedBox(height: 16),
          UiText.titleMedium(
            'Организация',
            style: TextStyle(fontWeight: .w600),
          ),
          const SizedBox(height: 8),
          OrganizationDropDownMenu(authorFormCubit: _authorFormCubit),
          const SizedBox(height: 16),
          UiText.titleMedium('Должность', style: TextStyle(fontWeight: .w600)),
          const SizedBox(height: 8),
          PostDropDownMenus(cubit: _authorFormCubit),
          const SizedBox(height: 8),
          AddPostButton(cubit: _authorFormCubit),
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
          AddInformationButton(authorFormCubit: _authorFormCubit),
          const SizedBox(height: 60),
        ],
      ),
    ),
  );

  AuthorEntity _createAuthor(UserEntity user, AuthorFormState formState) {
    final author = AuthorEntity(
      user: user as AuthenticatedUser,
      status: .teacher,
      lastNameRu: formState.lastNameRu,
      lastNameEn: formState.lastNameEn,
      firstNameRu: formState.firstNameRu,
      firstNameEn: formState.firstNameEn,
      middleNameRu: formState.middleNameRu,
      middleNameEn: formState.middleNameEn,
      organization: formState.organization!,
      educationLevel: null,
      posts: formState.posts!
          .where((postOrNull) => postOrNull.selectedPost != null)
          .map((post) => post.selectedPost!)
          .toList(),
      academicDegree: formState.academicDegree,
      academicTitle: formState.academicTitle,
    );
    return author;
  }
}
