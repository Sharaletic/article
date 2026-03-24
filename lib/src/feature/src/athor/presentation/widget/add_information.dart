import 'package:ui_kit/ui_kit.dart';
import '../../author.dart';

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  var selectedStatus = AuthorStatus.student;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return Scaffold(
      backgroundColor: palette.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: const SizedBox(height: 84)),
          SliverToBoxAdapter(child: const AddInformationHeader()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const .symmetric(horizontal: 24),
              child: UiSegmentedButton(
                selected: selectedStatus,
                onSelected: (selected) {
                  setState(() {
                    selectedStatus = selected;
                  });
                },
                items: AuthorStatus.values,
                itemLabelBuilder: (status) => UiText.titleSmall(status.value),
              ),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          if (selectedStatus == AuthorStatus.student)
            const SliverToBoxAdapter(child: StudentForm()),
          if (selectedStatus == AuthorStatus.teacher)
            const SliverToBoxAdapter(child: TeacherForm()),
        ],
      ),
    );
  }
}
