## 🚀 起動方法

前提: Flutter SDK (pubspec 内 `environment: sdk: ^3.9.2`) / (任意) FVM 利用。

1. リポジトリ取得 & ブランチ確認
   ```powershell
   git clone <REPO_URL>
   cd wellbeing_app
   git checkout dev
   ```
2. (任意) FVM セットアップ
   ```powershell
   fvm install 3.9.2
   fvm use 3.9.2
   ```
3. 依存取得
   ```powershell
   fvm flutter pub get   # FVM未使用なら flutter pub get
   ```
4. コード生成 (Riverpod / Freezed / Retrofit / JsonSerializable)
   ```powershell
   fvm dart run build_runner build --delete-conflicting-outputs
   ```
   変更を繰り返す開発中は `watch` が便利:
   ```powershell
   fvm dart run build_runner watch --delete-conflicting-outputs
   ```
5. 実行
   ```powershell
   fvm flutter run
   ```

トラブルシュート (生成が壊れた場合):

```powershell
Remove-Item -Recurse -Force .dart_tool
fvm flutter pub get
fvm dart run build_runner build --delete-conflicting-outputs
```

## 🧱 フォルダ構成 (クリーンアーキテクチャ)

```
lib/
	app.dart                  # MaterialApp / 全体設定 (予定/共通)
	main.dart                 # エントリポイント
	config/                   # 定数・設定 (例: Theme, Flavor 等)
	core/                     # 横断的関心事 (Cross-cutting)
		api/                    # Dio / Retrofit APIクライアント
		errors/                 # Result型・例外関連
		enums/                  # 列挙型
		logging/                # ロギング (logger.dart)
		providers.dart/         # (命名再確認推奨) グローバル Provider 定義集
	domain/                   # ドメイン層 (UI非依存)
		entities/               # エンティティ (例: user.dart)
		repositories/           # 抽象リポジトリ (interface)
	data/                     # データ取得実装層
		models/                 # DTO/Model (Freezed + Json)
			user.dart / user.freezed.dart / user.g.dart
		repositories/           # 実装クラス (UserRepositoryImpl など)
		providers/              # リポジトリを公開する Riverpod Provider
	presentaion/              # ← 'presentation' へリネーム推奨 (UI層)
		screens/                # 画面 (home/ など)
		routes/                 # ルーティング (GoRouter想定)
		providers/              # UI層専用の Provider / Notifier
```

レイヤ責務概要:

- Presentation: Widget / 画面 / ユーザー操作処理
- Domain: ビジネスルール (Entities / Repository 抽象)
- Data: API / DB / キャッシュ実装 + Domain へのマッピング
- Core: 共通機能 (ログ / 通信設定 / エラーハンドリング 等)

## 🔄 Presentation 層 → Data 層 呼び出しフロー

1. 画面 (`HomeScreen` 等) で Riverpod Provider を `ref.watch` / `ref.read`
2. Provider から Domain の `UserRepository` 抽象を取得 (`userRepositoryProvider`)
3. 実体は Data 層の `UserRepositoryImpl`
4. `UserRepositoryImpl` が `APIClient` (Retrofit + Dio) を用いて HTTP リクエスト
5. API レスポンスモデル (`CreateUserResponse` など) を Domain `UserEntity` に変換
6. `Result<UserEntity, Exception>` として成功/失敗を返却

### シーケンス (概念)

```
HomeScreen -> userRepositoryProvider -> UserRepositoryImpl -> APIClient(Dio/Retrofit)
	-> (HTTP) -> JSON -> Model -> Entity -> Result -> HomeScreen
```

### コード例 (ユーザー作成)

```dart
final repository = ref.read(userRepositoryProvider);
final result = await repository.create(
	UserEntity(id: '123', name: 'Taro', email: 'taro@example.com'),
);

result.when(
	success: (user) => appLogger.info('作成成功: ${user.id}'),
	failure: (e) => appLogger.severe('作成失敗: $e'),
);
```

### Provider の仕組み

`@riverpod` アノテーションを付与したファイルは `dart run build_runner build` 実行時に `*.g.dart` が生成されます。
例: `user_repository_provider.dart` -> `user_repository_provider.g.dart`

生成されない場合のチェックリスト:

- `riverpod_annotation` / `riverpod_generator` / `build_runner` が pubspec にあるか
- `part 'xxx.g.dart';` が正しく記述されているか
- `@riverpod` の直後の関数名が小文字始まりか (`UserRepository userRepository(Ref ref)` は OK)
- キャッシュ破損時は `.dart_tool` 削除後再生成

### 改善余地 / 今後の展開

- UseCase 層の追加 (複雑なアプリケーションロジック分離)
- エラー型の整理と `sealed class` 化
- API レスポンスと Entity のマッピングユーティリティ統合

---
