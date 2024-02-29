import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const User({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id : json['id'],
      email : json['email'],
      firstName : json['first_name'],
      lastName : json['last_name'],
      avatar : json['avatar'],
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

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}

