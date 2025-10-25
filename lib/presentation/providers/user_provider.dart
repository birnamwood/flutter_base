import 'package:flutter_base/core/logging/logger.dart';
import 'package:flutter_base/data/providers/user_repository_provider.dart';
import 'package:flutter_base/domain/entities/user.dart';
import 'package:flutter_base/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

/// ユーザー状態を管理するプロバイダー
///
/// ログイン状態、ユーザー情報の取得、認証処理などユーザー関連の状態を管理します。
@riverpod
class UserNotifier extends _$UserNotifier {
  @override
  UserEntity? build() {
    // 非同期でユーザー情報を読み込みます
    return null;
  }

  /// ユーザー情報を登録するメソッド
  Future<UserEntity?> registerUser() async {
    final UserRepository repository = ref.read(userRepositoryProvider);
    final UserEntity user = UserEntity(
      id: "1",
      name: "test user",
      email: "test@example.com",
    );
    final result = await repository.create(user);
    return result.when(
      success: (UserEntity user) {
        state = user;
        return user;
      },
      failure: (Exception error) {
        appLogger.error('ユーザー情報の検証に失敗しました: $error');
        // エラーが発生した場合はnullを返す（未ログイン状態）
        return null;
      },
    );
  }
}
