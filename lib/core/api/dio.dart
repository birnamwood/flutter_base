import 'package:dio/dio.dart';
import 'package:flutter_base/config/constants.dart';
import 'package:flutter_base/core/logging/logger.dart';

/// Dioインスタンスを作成する関数です。
/// ベースURL、タイムアウト、インターセプターを設定します。
/// 戻り値: 設定済みのDioインスタンス
Dio createDio() {
  // TODO APIのベースURLを設定する
  const String url = ""; // APIのベースURLを指定してください
  final Dio dio = Dio(
    BaseOptions(baseUrl: url, contentType: "application/json"),
  );
  // タイムアウトの設定
  dio.options.connectTimeout = dioConnectTimeout;
  dio.options.receiveTimeout = dioReceiveTimeout;
  // インターセプターの設定
  dio.interceptors.add(_AuthInterceptor(dio));
  return dio;
}

/// 認証用のInterceptorクラスです。
/// リクエストに認証トークンを追加し、エラーやレスポンスを処理します。
class _AuthInterceptor extends QueuedInterceptor {
  /// [dio] Dioインスタンス
  _AuthInterceptor(this.dio);
  final Dio dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    appLogger.info("=============");
    appLogger.info("リクエスト ${options.uri}");

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    appLogger.error("Dio OnError");
    appLogger.error(err.response.toString());
    if (err.response?.statusCode == 401) {
      // ストレージのトークンを消す
      appLogger.warning("401 - 認証エラー");
      // ToDo 自動ログアウト処理
      return handler.reject(
        DioException(
          requestOptions: err.requestOptions,
          response: err.response,
          type: err.type,
          error: err.error,
        ),
      );
    }
    appLogger.error(err.message ?? "Unknown error");
    appLogger.error(err.response?.data.toString() ?? "Unknown response data");
    return handler.next(err);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    appLogger.debug("onResponse");
    appLogger.debug(response.statusCode.toString());
    appLogger.debug(response.data.toString());
    return handler.next(response);
  }
}
