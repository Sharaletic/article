import 'package:arcticle_app/src/app/widget/dependencies_scope.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

import '../../../../core/core.dart';
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
    return Column(
      mainAxisAlignment: .start,
      crossAxisAlignment: .stretch,
      children: [
        UiText.titleMedium(
          'Введите название конференции',
          style: TextStyle(fontWeight: .w600),
        ),
        const SizedBox(height: 8),
        UiTextField.standard(
          style: UiTextFieldStyle(hintText: 'Выберите конференцию'),
          onChanged: _conferenceBloc.onTextChanged.add,
        ),
        Flexible(
          child: BlocConsumer<ConferenceBloc, ConferenceState>(
            bloc: _conferenceBloc,
            listener: (context, state) => state.mapOrNull(
              error: (state) => ErrorUtil.displayErrorSnackBar(
                context,
                state.message,
                state.stackTrace,
              ),
            ),
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
    );
  }
}
