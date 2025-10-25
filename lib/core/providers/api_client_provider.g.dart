// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// APIClientを提供するプロバイダーです。
/// Dioインスタンスを使用してAPIClientを生成します。

@ProviderFor(apiClient)
const apiClientProvider = ApiClientProvider._();

/// APIClientを提供するプロバイダーです。
/// Dioインスタンスを使用してAPIClientを生成します。

final class ApiClientProvider
    extends $FunctionalProvider<APIClient, APIClient, APIClient>
    with $Provider<APIClient> {
  /// APIClientを提供するプロバイダーです。
  /// Dioインスタンスを使用してAPIClientを生成します。
  const ApiClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientHash();

  @$internal
  @override
  $ProviderElement<APIClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  APIClient create(Ref ref) {
    return apiClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(APIClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<APIClient>(value),
    );
  }
}

String _$apiClientHash() => r'29849a32135f60a465192eabf5b2a9c1fd646111';
