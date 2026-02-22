import 'package:ui_kit/ui_kit.dart';

class UiCard extends StatelessWidget {
  const UiCard({required this.child, super.key, this.color, this.margin});
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorPalette = Theme.of(context).colorPalette;
    return Padding(
      padding: margin ?? const .all(0),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? colorPalette.mutedForeground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}
