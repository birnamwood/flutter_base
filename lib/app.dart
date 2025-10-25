import 'package:flutter/material.dart';
import 'package:flutter_base/presentation/routes/routes.dart';
import 'package:go_router/go_router.dart';

/// The main application widget.
class MainApp extends StatelessWidget {
  /// コンストラクタ
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: GoRouter(
        routes: Routes.getRoutes(),
        initialLocation: Routes.getInitialLocation(),
      ),
    );
  }
}
