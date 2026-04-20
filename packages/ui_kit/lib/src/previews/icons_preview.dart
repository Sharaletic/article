import 'package:ui_kit/ui_kit.dart';

class IconsPreview extends StatelessWidget {
  const IconsPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(ArticleIcons.home),
        Icon(ArticleIcons.article),
        Icon(ArticleIcons.history),
        Icon(ArticleIcons.person),
      ],
    );
  }
}
