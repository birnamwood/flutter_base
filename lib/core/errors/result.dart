/// sealed classに準拠したResultクラスを生成
sealed class Result<S, E extends Exception> {
  const Result();

  /// 成功判定を行います。
  /// [success]は成功時の処理を、
  /// [failure]は失敗時の処理をそれぞれ受け取ります。
  T when<T>({
    required T Function(S value) success,
    required T Function(E error) failure,
  }) {
    if (this is Success<S, E>) {
      return success((this as Success<S, E>).value);
    } else if (this is Failure<S, E>) {
      return failure((this as Failure<S, E>).exception);
    }
    throw StateError('Unhandled case in Result.when');
  }
}

/// Resultクラスに準拠したSuccessクラス
final class Success<S, E extends Exception> extends Result<S, E> {
  /// [value]は成功時の値を表します。
  const Success(this.value);

  /// [value]は成功時の値を表します。
  final S value;

  @override
  String toString() => 'Success(value: $value)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Success<S, E> &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  int get hashCode => value.hashCode;
}

/// Resultクラスに準拠したFailureクラス
final class Failure<S, E extends Exception> extends Result<S, E> {
  /// [exception]は失敗時の例外を表します。
  const Failure(this.exception);

  /// [exception]は失敗時の例外を表します。
  final E exception;

  @override
  String toString() => 'Failure(exception: $exception)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Failure<S, E> &&
          runtimeType == other.runtimeType &&
          exception == other.exception;

  @override
  int get hashCode => exception.hashCode;
}
