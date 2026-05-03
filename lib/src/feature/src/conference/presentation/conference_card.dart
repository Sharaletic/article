import 'package:ui_kit/ui_kit.dart';
import '../conference.dart';

class ConferenceCard extends StatelessWidget {
  const ConferenceCard({super.key, required this.conference});
  final ConferenceEntity conference;

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;
    return Container(
      margin: .symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: palette.secondary,
        borderRadius: .circular(12),
      ),
      child: Column(
        spacing: 8,
        children: [
          UiText.titleSmall(
            conference.title,
            style: TextStyle(color: palette.primary, fontWeight: .w600),
          ),
          UiText.titleSmall(
            '${conference.startConferenceDate} - ${conference.endConferenceDate}',
          ),
          for (var format in conference.conferenceFormat)
            UiText.bodySmall(
              format.name,
              style: TextStyle(color: palette.primary, fontWeight: .w600),
            ),
          UiText.bodySmall(conference.address),
        ],
      ),
    );
  }
}
