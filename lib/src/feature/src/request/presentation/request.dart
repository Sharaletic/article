import 'package:ui_kit/ui_kit.dart';
import '../request.dart';

class Request extends StatelessWidget {
  const Request({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final palette = theme.colorPalette;
    return Scaffold(
      backgroundColor: palette.background,
      body: const Padding(
        padding: .symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 84)),
            SliverToBoxAdapter(child: RequestHeader()),
            SliverToBoxAdapter(child: SizedBox(height: 24)),
            SliverToBoxAdapter(child: RequestForm()),
          ],
        ),
      ),
    );
  }
}
