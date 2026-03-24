import 'package:arcticle_app/src/app/app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../authentication/authentication.dart';
import '../../author.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({super.key});

  @override
  State<StudentForm> createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _lastNameRuController = TextEditingController();
  final _lastNameEnController = TextEditingController();
  final _firstNameRuController = TextEditingController();
  final _firstNameEnController = TextEditingController();
  final _middleNameRuController = TextEditingController();
  final _middleNameEnController = TextEditingController();
  final _organizationController = TextEditingController();
  final _educationLevelController = TextEditingController();

  OrganizationEntity? _organization;
  EducationLevel? _educationLevel;

  late final OrganizationsBloc organizationBloc;

  @override
  void initState() {
    super.initState();
    final dependencies = DependenciesScope.of(context);
    organizationBloc = OrganizationsBloc(
      organizationRepository: dependencies.organizationRepository,
      logger: dependencies.logger,
    );
    organizationBloc.add(const OrganizationsEvent.load());
  }

  @override
  void dispose() {
    _lastNameRuController.dispose();
    _lastNameEnController.dispose();
    _firstNameRuController.dispose();
    _firstNameEnController.dispose();
    _middleNameRuController.dispose();
    _middleNameEnController.dispose();
    _organizationController.dispose();
    _educationLevelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.mapOrNull(
          successfull: (state) {
            context.read<AuthorBloc>().add(
              AuthorEvent.createAuthor(
                status: .student,
                user: state.user as AuthenticatedUser,
                lastNameRu: _lastNameRuController.text,
                lastNameEn: _lastNameEnController.text,
                firstNameRu: _firstNameRuController.text,
                firstNameEn: _firstNameEnController.text,
                middleNameRu: _middleNameRuController.text,
                middleNameEn: _middleNameEnController.text,
                organization: _organization,
                educationLevel: _educationLevel,
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const .symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: .stretch,
          mainAxisSize: .min,
          children: [
            UiText.titleMedium(
              'Фамилия',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              controller: _lastNameRuController,
              style: UiTextFieldStyle(hintText: 'Фамилия на русском'),
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              controller: _lastNameEnController,
              style: UiTextFieldStyle(hintText: 'Фамилия на английском'),
            ),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Имя',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              controller: _firstNameRuController,
              style: UiTextFieldStyle(hintText: 'Имя на русском'),
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              controller: _firstNameEnController,
              style: UiTextFieldStyle(hintText: 'Имя на английском'),
            ),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Отчество (необязательно)',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              controller: _middleNameRuController,
              style: UiTextFieldStyle(hintText: 'Отчество на русском'),
            ),
            const SizedBox(height: 8),
            UiTextField.standard(
              controller: _middleNameEnController,
              style: UiTextFieldStyle(hintText: 'Отчество на английском'),
            ),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Организация',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            BlocBuilder<OrganizationsBloc, OrganizationsState>(
              bloc: organizationBloc,
              builder: (context, state) {
                List<Object> dropdownMenuEntries = state.map(
                  loading: (_) => ['Идет загрузка...'],
                  loaded: (state) => state.organizations,
                  error: (state) => [state.error],
                );
                return UiDropDownMenu.standard(
                  hintText: 'Поиск организации',
                  controller: _organizationController,
                  dropdownMenuEntries: dropdownMenuEntries,
                  itemLabelMenuBuilder: (org) => org is OrganizationEntity
                      ? '${org.titleRu} - ${org.titleEn}'
                      : dropdownMenuEntries.first.toString(),
                  itemValueMenuBuilder: (org) => org is OrganizationEntity
                      ? _organization = org
                      : dropdownMenuEntries.first,
                );
              },
            ),
            const SizedBox(height: 16),
            UiText.titleMedium(
              'Уровень обучения',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            UiDropDownMenu.standard(
              hintText: 'Поиск курса',
              controller: _educationLevelController,
              dropdownMenuEntries: EducationLevel.values,
              itemLabelMenuBuilder: (el) => el.value,
              itemValueMenuBuilder: (el) => _educationLevel = el,
            ),
            const SizedBox(height: 88),
            AddInformationButton(
              onPressed: () {
                context.read<AuthenticationBloc>().add(
                  AuthenticationEvent.updateDisplayName(
                    name: _createDisplayName(),
                  ),
                );
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  String _createDisplayName() {
    return '${_lastNameRuController.text} ${_firstNameRuController.text} ${_middleNameRuController.text}'
        .trim();
  }
}
