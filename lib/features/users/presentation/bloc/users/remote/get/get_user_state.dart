part of 'get_user_bloc.dart';

sealed class GetUserState extends Equatable {
  final List<UserEntity>? users;
  final DioException? error;

  const GetUserState({this.users, this.error});

  @override
  List<Object> get props => [users!, error!];
}

class GetUserLoading extends GetUserState {
  const GetUserLoading();
}

class GetUserSuccess extends GetUserState {
  const GetUserSuccess(List<UserEntity> users) : super(users: users);
}

class GetUserFailed extends GetUserState {
  const GetUserFailed(DioException error) : super(error: error);
}
