import 'package:flutter/material.dart';

/// ホーム画面を表すウィジェットです。
class HomeScreen extends StatelessWidget {
  /// コンストラクタ
  const HomeScreen({super.key, required this.title});

  /// 画面のタイトル
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Text('ホーム画面', style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
