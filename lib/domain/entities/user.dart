/// ユーザーを表すエンティティクラスです。
/// [id] ユーザーの一意の識別子
/// [name] ユーザーの名前
class UserEntity {
  /// コンストラクタ
  /// [id] ユーザーの一意の識別子
  /// [email] ユーザーのメールアドレス
  /// [name] ユーザーの名前
  UserEntity({required this.id, required this.name, required this.email});

  /// ユーザーの一意の識別子
  final String id;

  /// ユーザーのメールアドレス
  final String email;

  /// ユーザーの名前
  final String name;

  /// ユーザーインスタンスのコピーを作成し、指定したフィールドを更新します
  UserEntity copyWith({String? id, String? email, String? name}) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'UserEntity{id: $id, name: $name}';
  }
}
