import 'dart:math' as math;
import '../../ui_kit.dart';

final lightTheme = createThemeData(
  brightness: Brightness.light,
  palette: lightColorPalette,
  typography: defaultTypography,
);

final darkTheme = createThemeData(
  brightness: Brightness.dark,
  palette: darkColorPalette,
  typography: defaultTypography,
);

void main() {
  runApp(const UiKit());
}

class UiKit extends StatelessWidget {
  const UiKit({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darkTheme,
      theme: lightTheme,
      home: const UiPreview(),
    );
  }
}

class UiPreview extends StatelessWidget {
  const UiPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorPalette.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).colorPalette.background,
            surfaceTintColor: Theme.of(context).colorPalette.background,
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: math.max((size.width - 900) / 2, 16),
              vertical: 24,
            ),
            sliver: SliverList.list(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleMedium(
                    'Typography',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                const TypographyPreview(),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleMedium(
                    'Buttons',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                const ButtonsPreview(),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: UiText.titleMedium(
                    'Text Inputs',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 8),
                const TextFieldsPreview(),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
