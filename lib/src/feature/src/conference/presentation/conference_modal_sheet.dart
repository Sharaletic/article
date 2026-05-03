import 'package:arcticle_app/src/app/widget/dependencies_scope.dart';
import 'package:arcticle_app/src/feature/src/conference/state_management/conference/conference_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

import '../conference.dart';

class ConferenceModalSheet extends StatefulWidget {
  const ConferenceModalSheet({super.key});

  @override
  State<ConferenceModalSheet> createState() => _ConferenceModalSheetState();
}

class _ConferenceModalSheetState extends State<ConferenceModalSheet> {
  late final ConferenceBloc _conferenceBloc;
  @override
  void initState() {
    super.initState();
    final conferenceRepository = DependenciesScope.of(
      context,
    ).conferenceRepository;
    _conferenceBloc = ConferenceBloc(
      conferenceRepository: conferenceRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 24, vertical: 56),
      child: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .stretch,
        children: [
          UiText.titleLarge(
            'Выберите конференцию',
            style: TextStyle(fontWeight: .w600),
          ),
          const SizedBox(height: 28),
          UiText.titleMedium(
            'Введите название конференции',
            style: TextStyle(fontWeight: .w600),
          ),
          const SizedBox(height: 8),
          UiTextField.standard(
            style: UiTextFieldStyle(hintText: 'Выберите конференцию'),
            onChanged: _conferenceBloc.onTextChanged.add,
          ),
          Expanded(
            child: BlocBuilder<ConferenceBloc, ConferenceState>(
              bloc: _conferenceBloc,
              builder: (context, state) =>
                  state.mapOrNull(
                    loading: (_) => const CircularProgressIndicator(),
                    loaded: (state) =>
                        ConferenceList(conferences: state.conferences!),
                    noSearched: (_) => UiText.bodySmall('Начните искать'),
                    notFound: (_) => UiText.bodySmall('Ничего не нашлось'),
                  ) ??
                  const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
