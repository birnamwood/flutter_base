import 'package:flutter_base/core/api/api_client.dart';
import 'package:flutter_base/core/providers/api_client_provider.dart';
import 'package:flutter_base/data/repositories/user_repository_impl.dart';
import 'package:flutter_base/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository_provider.g.dart';

/// UserRepositoryProviderは、ユーザー関連のデータ操作を提供するリポジトリを提供します。
/// [UserRepository]を実装した[UserRepositoryImpl]のインスタンスを返します。
@riverpod
UserRepository userRepository(Ref ref) {
  final APIClient apiClient = ref.watch(apiClientProvider);

  return UserRepositoryImpl(apiClient);
}
