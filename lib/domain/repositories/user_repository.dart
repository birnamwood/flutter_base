import 'package:flutter_base/core/errors/result.dart';
import 'package:flutter_base/domain/entities/user.dart';

/// UserRepositoryは、ユーザー関連のデータ操作を抽象化するインターフェースです。
abstract class UserRepository {
  /// 新しいユーザーを作成します。
  /// [user] 作成するユーザーの情報を含む[UserEntity]
  Future<Result<UserEntity, Exception>> create(UserEntity user);
}
