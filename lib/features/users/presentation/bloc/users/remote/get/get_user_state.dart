part of 'get_user_bloc.dart';

sealed class GetUserState extends Equatable {
  final UserListEntity? users;
  final DioException? error;

  const GetUserState({this.users, this.error});

  @override
  List<Object> get props => [users!, error!];
}

class GetUserLoading extends GetUserState {
  const GetUserLoading();
}

class GetUserSuccess extends GetUserState {
  const GetUserSuccess(UserListEntity users) : super(users: users);
}

class GetUserFailed extends GetUserState {
  const GetUserFailed(DioException error) : super(error: error);
}
