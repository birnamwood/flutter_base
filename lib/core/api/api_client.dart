import 'package:dio/dio.dart';
import 'package:flutter_base/data/models/user.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

/// APIクライアントを定義する抽象クラスです。
/// Retrofitを使用してAPIリクエストを簡略化します。
@RestApi()
abstract class APIClient {
  /// [dio]を使用してAPIクライアントのインスタンスを作成します。
  factory APIClient(Dio dio) = _APIClient;

  /// ユーザーの登録リクエストを送信します。
  @POST('/user')
  Future<CreateUserResponse> createUser(@Body() CreateUserRequest req);
}
