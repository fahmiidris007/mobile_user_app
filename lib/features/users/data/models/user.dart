import 'package:mobile_user_app/features/users/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel(
    int id,
    String email,
    String firstName,
    String lastName,
    String avatar,
  ) : super(id, email, firstName, lastName, avatar);

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      map['id'],
      map['email'],
      map['first_name'],
      map['last_name'],
      map['avatar'],
    );
  }
}
