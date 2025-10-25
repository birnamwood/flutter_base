import 'package:flutter_base/domain/entities/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// [CreateUserRequest]は、ユーザー情報を取得するためのAPIリクエストを表すクラスです。
@freezed
abstract class CreateUserRequest with _$CreateUserRequest {
  /// [CreateUserRequest]のコンストラクタです。
  const factory CreateUserRequest({
    required String userId,
    required String email,
    required String name,
  }) = _CreateUserRequest;

  /// JSONから[CreateUserRequest]を生成するファクトリメソッドです。
  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);
}

/// [CreateUserResponse]は、ユーザー情報を取得するためのAPIレスポンスを表すクラスです。
@freezed
abstract class CreateUserResponse with _$CreateUserResponse {
  /// [CreateUserResponse]のコンストラクタです。
  const factory CreateUserResponse({
    required String userId,
    required String email,
    required String name,
  }) = _CreateUserResponse;

  /// JSONから[CreateUserResponse]を生成するファクトリメソッドです。
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

/// [CreateUserResponse]の拡張メソッドを提供します。
extension CreateUserResponseX on CreateUserResponse {
  /// [UserVerifyResponse]を[UserEntity]に変換します。
  /// 戻り値: [UserEntity]オブジェクト
  UserEntity toEntity() => UserEntity(id: userId, name: name, email: email);
}
