import 'package:flutter/foundation.dart';
import 'package:flutter_base/core/enums/log_level.dart';

/// アプリケーション全体で使用するロガーのインスタンス
final Logger appLogger = Logger();

/// デバッグ用のPrint関数です。
/// デバッグモードの時のみ、メッセージをコンソールに出力します。
void _debugConsolePrint(dynamic object) {
  if (kDebugMode) {
    print(object);
  }
}

/// アプリケーション全体で使用するロガー
class Logger {
  /// ロガーのコンストラクタ
  ///
  /// [logLevel] - 表示するログのレベル（デフォルトは [LogLevel.debug]）
  Logger([this._logLevel = LogLevel.debug]);

  final LogLevel _logLevel;

  /// デバッグメッセージをログに記録する
  ///
  /// [message] - ログに記録するメッセージ
  void debug(String message) {
    if (_logLevel.index >= LogLevel.debug.index) {
      _debugConsolePrint('🔍 DEBUG: $message');
    }
  }

  /// 情報メッセージをログに記録する
  ///
  /// [message] - ログに記録するメッセージ
  void info(String message) {
    if (_logLevel.index >= LogLevel.info.index) {
      _debugConsolePrint('ℹ️ INFO: $message');
    }
  }

  /// 警告メッセージをログに記録する
  ///
  /// [message] - ログに記録するメッセージ
  void warning(String message) {
    if (_logLevel.index >= LogLevel.warning.index) {
      _debugConsolePrint('⚠️ WARN: $message');
    }
  }

  /// エラーメッセージをログに記録する
  ///
  /// [message] - ログに記録するメッセージ
  /// [error] - 例外オブジェクト（オプション）
  /// [stackTrace] - スタックトレース（オプション）
  void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (_logLevel.index >= LogLevel.error.index) {
      _debugConsolePrint('❌ ERROR: $message');
      if (error != null) _debugConsolePrint('  ERROR DETAILS: $error');
      if (stackTrace != null) _debugConsolePrint('  STACK: $stackTrace');
    }
  }
}
