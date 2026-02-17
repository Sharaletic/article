import 'package:ui_kit/ui_kit.dart';
import '../../authentication.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorPalette;

    return Scaffold(
      backgroundColor: palette.background,
      body: const Padding(
        padding: .symmetric(horizontal: 24, vertical: 84),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [AuthHeader(), SizedBox(height: 24), AuthForm()],
        ),
      ),
    );
  }
}
