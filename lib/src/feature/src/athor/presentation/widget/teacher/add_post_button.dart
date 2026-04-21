import 'package:ui_kit/ui_kit.dart';
import '../../../author.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key, required this.postCounter});
  final PostCounter postCounter;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ValueListenableBuilder(
        valueListenable: postCounter.posts,
        builder: (_, value, _) {
          return UiButton.text(
            icon: Icon(Icons.hdr_plus),
            label: const Text('Добавить должность'),
            style: TextButton.styleFrom(
              minimumSize: .zero,
              padding: .zero,
              tapTargetSize: .shrinkWrap,
            ),
            onPressed: postCounter.addEmptyPost,
            enabled: value.length < 3,
          );
        },
      ),
    );
  }
}
