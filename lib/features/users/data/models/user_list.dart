import 'package:mobile_user_app/features/users/data/models/user.dart';
import 'package:mobile_user_app/features/users/domain/entities/user_list.dart';

class UserListModel extends UserListEntity {
  const UserListModel(
    int page,
    int perPage,
    int total,
    int totalPages,
    List<UserModel> data,
  ) : super(page, perPage, total, totalPages, data);

  @override
  List<Object> get props => [page, perPage, total, totalPages, data];

  factory UserListModel.fromJson(Map<String, dynamic> map) {
    return UserListModel(
      map['page'],
      map['per_page'],
      map['total'],
      map['total_pages'],
      List<UserModel>.from(
        map['data'].map((x) => UserModel.fromJson(x)),
      ),
    );
  }
}
