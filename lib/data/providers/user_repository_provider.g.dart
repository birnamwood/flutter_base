// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// UserRepositoryProviderは、ユーザー関連のデータ操作を提供するリポジトリを提供します。
/// [UserRepository]を実装した[UserRepositoryImpl]のインスタンスを返します。

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

/// UserRepositoryProviderは、ユーザー関連のデータ操作を提供するリポジトリを提供します。
/// [UserRepository]を実装した[UserRepositoryImpl]のインスタンスを返します。

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  /// UserRepositoryProviderは、ユーザー関連のデータ操作を提供するリポジトリを提供します。
  /// [UserRepository]を実装した[UserRepositoryImpl]のインスタンスを返します。
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'28670886fc82ec7a3056966925661e393bb816cd';
