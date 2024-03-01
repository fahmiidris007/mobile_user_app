import 'package:equatable/equatable.dart';
import 'package:mobile_user_app/data/models/user.dart';

class FavUser extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const FavUser(
      {this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory FavUser.fromJson(Map<String, dynamic> json) {
    return FavUser(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }

  FavUser.fromUser(User user)
      : id = user.id,
        email = user.email,
        firstName = user.firstName,
        lastName = user.lastName,
        avatar = user.avatar;

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}
