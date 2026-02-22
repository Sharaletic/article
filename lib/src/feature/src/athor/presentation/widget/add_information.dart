import 'package:ui_kit/ui_kit.dart';
import '../../author.dart';

enum Status {
  student('Студент'),
  teacher('Преподаватель');

  const Status(this.value);
  final String value;
}

class AddInformation extends StatefulWidget {
  const AddInformation({super.key});

  @override
  State<AddInformation> createState() => _AddInformationState();
}

class _AddInformationState extends State<AddInformation> {
  var selectedStatus = Status.student;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return Scaffold(
      backgroundColor: palette.background,
      body: Padding(
        padding: const .symmetric(horizontal: 24, vertical: 84),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            const AddInformationHeader(),
            UiSegmentedButton(
              selected: selectedStatus,
              onSelected: (selected) {
                setState(() {
                  selectedStatus = selected;
                });
              },
              items: Status.values,
              itemLabelBuilder: (status) => UiText.titleSmall(status.value),
            ),
            const SizedBox(height: 16),
            if (selectedStatus == Status.student) const StudentForm(),
            if (selectedStatus == Status.teacher) const TeacherForm(),
          ],
        ),
      ),
    );
  }
}
