import 'package:ui_kit/ui_kit.dart';

import '../../conference/conference.dart';

class RequestForm extends StatefulWidget {
  const RequestForm({super.key});

  @override
  State<RequestForm> createState() => _RequestFormState();
}

class _RequestFormState extends State<RequestForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      mainAxisSize: .min,
      children: [
        UiText.titleMedium(
          'Выберите конференцию',
          style: TextStyle(fontWeight: .w600),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          style: UiTextFieldStyle(hintText: 'Выберите конференцию'),
          onTap: () => showModalBottomSheet(
            backgroundColor: Colors.white,
            context: context,
            builder: (context) => ConferenceModalSheet(),
          ),
        ),
      ],
    );
  }
}
