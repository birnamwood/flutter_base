import 'package:flutter/material.dart';
import 'package:flutter_base/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(overrides: [], child: MyApp()));
}
