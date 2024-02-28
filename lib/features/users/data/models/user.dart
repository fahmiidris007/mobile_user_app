import 'package:mobile_user_app/features/users/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      email: map['email'] ?? "",
      firstName: map['first_name'] ?? "",
      lastName: map['last_name'] ?? "",
      avatar: map['avatar'] ?? "",
    );
  }
}
