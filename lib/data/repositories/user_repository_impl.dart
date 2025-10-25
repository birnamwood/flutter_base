import 'package:flutter_base/core/api/api_client.dart';
import 'package:flutter_base/core/errors/result.dart';
import 'package:flutter_base/data/models/user.dart';
import 'package:flutter_base/domain/entities/user.dart';
import 'package:flutter_base/domain/repositories/user_repository.dart';

/// ユーザー関連のデータ操作を行うリポジトリクラスです。
class UserRepositoryImpl implements UserRepository {
  /// [apiClient]を使用してリポジトリを初期化します。
  UserRepositoryImpl(APIClient apiClient) : _apiClient = apiClient;

  final APIClient _apiClient;

  /// 認証データソース

  /// CognitoAuthを使用して、ユーザーのセッションを確認します。
  @override
  Future<Result<UserEntity, Exception>> create(UserEntity user) async {
    try {
      final CreateUserRequest req = CreateUserRequest(
        userId: user.id,
        email: user.email,
        name: user.name,
      );
      final result = await _apiClient.createUser(req);
      if (!result.userId.isEmpty) {
        return Failure<UserEntity, Exception>(Exception('ユーザー作成に失敗しました'));
      }
      final UserEntity returnUser = result.toEntity();
      return Success<UserEntity, Exception>(returnUser);
    } catch (e) {
      return Failure<UserEntity, Exception>(Exception('ユーザー作成に失敗しました: $e'));
    }
  }
}
