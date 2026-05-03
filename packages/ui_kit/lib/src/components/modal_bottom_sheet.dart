import '../../ui_kit.dart';

Future<T?> showUiModalBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  String? barrierLabel,
  Color? barrierColor,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool useSafeArea = true,
  double? maxHeightFactor,
  RouteSettings? routeSettings,
  AnimationStyle? sheetAnimationStyle,
}) {
  final palette = Theme.of(context).colorPalette;
  return showModalBottomSheet<T>(
    constraints: const BoxConstraints(
      maxWidth: .infinity,
      maxHeight: .infinity,
    ),
    context: context,
    builder: builder,
    backgroundColor: backgroundColor ?? palette.background,
    shape: const RoundedRectangleBorder(
      borderRadius: .vertical(top: .circular(28)),
    ),
    barrierColor: barrierColor,
    isScrollControlled: isScrollControlled,
    useRootNavigator: useRootNavigator,
    useSafeArea: useSafeArea,
    routeSettings: routeSettings,
  );
}

class UiModalBottomSheetHeader extends StatelessWidget {
  const UiModalBottomSheetHeader({
    super.key,
    required this.title,
    this.description,
  });

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: .min,
      crossAxisAlignment: .start,
      children: [
        Row(
          spacing: 12,
          children: [
            Expanded(
              child: UiText.titleLarge(
                title,
                style: TextStyle(fontWeight: .w600),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
            ),
          ],
        ),
        if (description != null) ...[
          const SizedBox(height: 12),
          UiText.bodyMedium(description!),
        ],
      ],
    );
  }
}

class UiModalBottomSheet extends StatelessWidget {
  const UiModalBottomSheet({
    super.key,
    required this.title,
    this.description,
    required this.content,
    this.padding = const .symmetric(horizontal: 20, vertical: 32),
  });
  final String title;
  final String? description;
  final Widget content;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: padding.add(.only(bottom: bottomInset)),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .stretch,
        children: [
          UiModalBottomSheetHeader(title: title, description: description),
          const SizedBox(height: 16),
          Flexible(child: content),
        ],
      ),
    );
  }
}
