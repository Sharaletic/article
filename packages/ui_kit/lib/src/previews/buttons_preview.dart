import '../../ui_kit.dart';

class ButtonsPreview extends StatelessWidget {
  const ButtonsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [_FilledPrimaryButton(), _TextButton(), _SegmentedButton()],
        ),
      ),
    );
  }
}

class _FilledPrimaryButton extends StatelessWidget {
  const _FilledPrimaryButton();

  @override
  Widget build(BuildContext context) => UiCard(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          UiButton.filledPrimary(
            onPressed: () {},
            label: const Text('Primary'),
          ),
          const SizedBox(height: 8),
          UiButton.filledPrimary(
            icon: const Icon(Icons.add_rounded),
            onPressed: () {},
            label: const Text('Primary'),
          ),
          const SizedBox(height: 8),
          UiButton.filledPrimary(
            onPressed: () {},
            enabled: false,
            label: const Text('Primary'),
          ),
          const SizedBox(height: 8),
          UiButton.filledPrimary(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded),
            enabled: false,
            label: const Text('Primary'),
          ),
          const SizedBox(height: 8),
          UiButton.filledPrimary(
            onPressed: () {},
            enabled: false,
            label: SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Theme.of(
                  context,
                ).colorPalette.primary.withValues(alpha: .38),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _TextButton extends StatelessWidget {
  const _TextButton();

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Align(
        alignment: Alignment.center,
        child: UiText.titleSmall('Text Button'),
      ),
      const SizedBox(height: 16),
      UiButton.text(onPressed: () {}, label: const Text('standard')),
      const SizedBox(height: 8),
      UiButton.text(
        onPressed: () {},
        label: const Text('disabled'),
        enabled: false,
      ),
    ],
  );
}

class _SegmentedButton extends StatelessWidget {
  const _SegmentedButton();

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Align(
        alignment: Alignment.center,
        child: UiText.titleSmall('Segmented Button'),
      ),
      const SizedBox(height: 16),
      // UiSegmentedButton(
      //   onSelected: (selected) => print(selected),
      //   items: const ['button1', 'button2'],
      // ),
    ],
  );
}
