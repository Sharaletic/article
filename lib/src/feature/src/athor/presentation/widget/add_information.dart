import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';
import '../../author.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
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
                child: BlocBuilder<AuthorFormCubit, AuthorFormState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        UiSegmentedButton(
                          selected: state.status,
                          onSelected: (selected) =>
                              _authorFormCubit.statusChanged(selected),
                          items: AuthorStatus.values,
                          itemLabelBuilder: (status) =>
                              UiText.titleSmall(status.value),
                        ),
                        const SizedBox(height: 16),
                        Stack(
                          children: [
                            Visibility(
                              visible:
                                  _authorFormCubit.state.status == .student,
                              maintainState: true,
                              maintainSize: false,
                              child: const StudentForm(),
                            ),
                            Visibility(
                              visible:
                                  _authorFormCubit.state.status == .teacher,
                              maintainState: true,
                              maintainSize: false,
                              child: const TeacherForm(),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
