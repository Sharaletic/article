import 'package:flutter/widgets.dart';
import '../app.dart';

class DependenciesScope extends StatelessWidget {
  const DependenciesScope({
    required this.dependencies,
    required this.child,
    super.key,
  });
  final IAppDependencies dependencies;
  final Widget child;

  static IAppDependencies of(BuildContext context, {bool listen = true}) {
    final inheritedWidget = listen
        ? context.dependOnInheritedWidgetOfExactType<_DependenciesInherited>()
        : context.getInheritedWidgetOfExactType<_DependenciesInherited>();
    return inheritedWidget?.dependencies ??
        (throw Exception('$DependenciesScope not found in the context.'));
  }

  @override
  Widget build(BuildContext context) =>
      _DependenciesInherited(dependencies: dependencies, child: child);
}

class _DependenciesInherited extends InheritedWidget {
  const _DependenciesInherited({
    required this.dependencies,
    required super.child,
  });

  final IAppDependencies dependencies;

  @override
  bool updateShouldNotify(_DependenciesInherited oldWidget) =>
      oldWidget.dependencies != dependencies;
}
