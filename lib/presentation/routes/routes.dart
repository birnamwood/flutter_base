import 'package:flutter/material.dart';
import 'package:flutter_base/presentation/screens/home.dart';
import 'package:go_router/go_router.dart';

/// アプリケーションのルート一覧を定義したクラスです。
///
/// このクラスは、アプリケーション内の各画面へのルートを定義し、
/// GoRouterで使用するルート構成を提供します。
class Routes {
  /// ルート定義を取得します
  static List<RouteBase> getRoutes() {
    return <RouteBase>[
      GoRoute(
        path: '/', // ホームルートは特別に '/' を直接指定
        name: 'home',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(title: 'ホーム'),
      ),
    ];
  }

  /// デフォルトの初期ルートを取得します
  static String getInitialLocation() {
    return '/'; // ホームルートは単純に '/' を直接指定
  }
}
