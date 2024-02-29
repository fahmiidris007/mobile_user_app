// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:mobile_user_app/features/users/domain/entities/user.dart';

class UserListEntity extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserEntity> data;

  const UserListEntity(
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  );

  @override
  List<Object> get props => [page, perPage, total, totalPages, data];
}
