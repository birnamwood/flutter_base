import 'package:dio/dio.dart';
import 'package:flutter_base/core/api/api_client.dart';
import 'package:flutter_base/core/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client_provider.g.dart';

/// APIClientを提供するプロバイダーです。
/// Dioインスタンスを使用してAPIClientを生成します。
@riverpod
APIClient apiClient(Ref ref) {
  final Dio dio = ref.watch(dioProvider);
  return APIClient(dio);
}
