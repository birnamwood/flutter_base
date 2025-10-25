// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// ユーザー状態を管理するプロバイダー
///
/// ログイン状態、ユーザー情報の取得、認証処理などユーザー関連の状態を管理します。

@ProviderFor(UserNotifier)
const userProvider = UserNotifierProvider._();

/// ユーザー状態を管理するプロバイダー
///
/// ログイン状態、ユーザー情報の取得、認証処理などユーザー関連の状態を管理します。
final class UserNotifierProvider
    extends $NotifierProvider<UserNotifier, UserEntity?> {
  /// ユーザー状態を管理するプロバイダー
  ///
  /// ログイン状態、ユーザー情報の取得、認証処理などユーザー関連の状態を管理します。
  const UserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userNotifierHash();

  @$internal
  @override
  UserNotifier create() => UserNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserEntity? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserEntity?>(value),
    );
  }
}

String _$userNotifierHash() => r'60c0812215a0664496dd03af5776668bcb3fe70e';

/// ユーザー状態を管理するプロバイダー
///
/// ログイン状態、ユーザー情報の取得、認証処理などユーザー関連の状態を管理します。

abstract class _$UserNotifier extends $Notifier<UserEntity?> {
  UserEntity? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<UserEntity?, UserEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserEntity?, UserEntity?>,
              UserEntity?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
