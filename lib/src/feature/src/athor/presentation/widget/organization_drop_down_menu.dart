import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../../../../app/app.dart';
import '../../author.dart';

class OrganizationDropDownMenu extends StatefulWidget {
  const OrganizationDropDownMenu({
    super.key,
    required AuthorFormCubit authorFormCubit,
  }) : _authorFormCubit = authorFormCubit;
  final AuthorFormCubit _authorFormCubit;

  @override
  State<OrganizationDropDownMenu> createState() =>
      _OrganizationDropDownMenuState();
}

class _OrganizationDropDownMenuState extends State<OrganizationDropDownMenu> {
  late final OrganizationsBloc _organizationBloc;
  final _organizationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final dependencies = DependenciesScope.of(context);
    _organizationBloc = OrganizationsBloc(
      organizationRepository: dependencies.organizationRepository,
      logger: dependencies.logger,
    );

    _organizationController.addListener(() {
      if (_organizationController.text.isNotEmpty) {
        _organizationBloc.onTextChanged.add(_organizationController.text);
      }
    });
  }

  @override
  void dispose() {
    _organizationBloc.close();
    _organizationController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizationsBloc, OrganizationsState>(
      bloc: _organizationBloc,
      builder: (context, state) {
        List<OrganizationEntity> organizations = state.maybeMap(
          loaded: (state) => state.organizations ?? <OrganizationEntity>[],
          orElse: () => <OrganizationEntity>[],
        );
        return UiDropDownMenu.standard(
          controller: _organizationController,
          enableFilter: false,
          enableSearch: false,
          hintText: 'Поиск организации',
          selectedTrailingIcon: null,
          menuHeight: organizations.isEmpty ? 0 : null,
          dropdownMenuEntries: organizations,
          itemLabelMenuBuilder: (org) => '${org.titleRu} - ${org.titleEn}',
          itemValueMenuBuilder: (org) => org,
          onSelected: widget._authorFormCubit.organizationChanged,
          enabled: state.maybeMap(error: (_) => false, orElse: () => true),
        );
      },
    );
  }
}
