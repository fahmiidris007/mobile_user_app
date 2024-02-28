import 'package:mobile_user_app/features/users/data/models/user.dart';

class UserResponseModel {
  const UserResponseModel({
    int? page,
    int? perPage,
    int? total,
    int? totalPages,
    List<UserModel>? data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> map) {
    return UserResponseModel(
      page: map['page'] ?? 0,
      perPage: map['per_page'] ?? 0,
      total: map['total'] ?? 0,
      totalPages: map['total_pages'] ?? 0,
      data: map['data'] != null
          ? List<UserModel>.from(map['data'].map((x) => UserModel.fromJson(x)))
          : [],
    );
  }
}
