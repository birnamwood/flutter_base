import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

/// APIクライアントを定義する抽象クラスです。
/// Retrofitを使用してAPIリクエストを簡略化します。
@RestApi()
abstract class APIClient {
  /// [dio]を使用してAPIクライアントのインスタンスを作成します。
  factory APIClient(Dio dio) = _APIClient;

  /// ユーザーのトークンを検証するAPIリクエストを送信します。
  /// [token] 検証するトークン
  /// 戻り値: トークン検証の結果を含む[UserVerifyResponse]
  @POST('/test')
  Future<String> test(@Body() String token);
}
