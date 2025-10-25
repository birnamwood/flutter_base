import 'package:dio/dio.dart';
import 'package:flutter_base/core/api/dio.dart';
import 'package:flutter_base/core/logging/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

/// Dioインスタンスを提供するプロバイダーです。
/// [createDio]関数を使用してDioインスタンスを生成します。
@riverpod
Dio dio(Ref ref) {
  appLogger.info('Dioインスタンスを生成します。');
  return createDio();
}
