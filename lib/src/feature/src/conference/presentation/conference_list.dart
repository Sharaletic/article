import 'package:ui_kit/ui_kit.dart';
import '../conference.dart';

class ConferenceList extends StatelessWidget {
  const ConferenceList({super.key, required this.conferences});
  final List<ConferenceEntity> conferences;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) =>
          ConferenceCard(conference: conferences[index]),
      separatorBuilder: (context, index) => Container(),
      itemCount: conferences.length,
    );
  }
}
