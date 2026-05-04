import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../author.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  final ValueNotifier<AuthorStatus> _selectedStatus =
      ValueNotifier<AuthorStatus>(.student);

  late final AuthorFormCubit _authorFormCubit;

  @override
  void initState() {
    super.initState();
    _authorFormCubit = AuthorFormCubit();
  }

  @override
  void dispose() {
    _authorFormCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return BlocProvider<AuthorFormCubit>.value(
      value: _authorFormCubit,
      child: Scaffold(
        backgroundColor: palette.background,
        body: Padding(
          padding: const .symmetric(horizontal: 24),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: const SizedBox(height: 84)),
              SliverToBoxAdapter(child: const AddInformationHeader()),
              SliverToBoxAdapter(child: const SizedBox(height: 24)),
              SliverToBoxAdapter(
                child: ValueListenableBuilder<AuthorStatus>(
                  valueListenable: _selectedStatus,
                  builder: (_, value, _) => UiSegmentedButton(
                    selected: value,
                    onSelected: (selected) {
                      _selectedStatus.value = selected;
                      _authorFormCubit.statusChanged(selected);
                    },
                    items: AuthorStatus.values,
                    itemLabelBuilder: (status) =>
                        UiText.titleSmall(status.value),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: const SizedBox(height: 16)),
              ValueListenableBuilder<AuthorStatus>(
                valueListenable: _selectedStatus,
                builder: (_, value, _) => SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Visibility(
                        visible: value == .student,
                        maintainState: true,
                        maintainSize: false,
                        child: const StudentForm(),
                      ),
                      Visibility(
                        visible: value == .teacher,
                        maintainState: true,
                        maintainSize: false,
                        child: const TeacherForm(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
