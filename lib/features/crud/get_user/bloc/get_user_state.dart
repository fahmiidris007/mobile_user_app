part of 'get_user_bloc.dart';

@immutable
sealed  class GetUserState extends Equatable {
  const GetUserState();
}

class GetUserLoading extends GetUserState{
  @override

  List<Object?> get props => [];
}

class GetUserLoaded extends GetUserState{
  const GetUserLoaded({this.user = const <User>[]});

  final List<User> user;
  @override
  List<Object?> get props => [user];

}

class GetUserError extends GetUserState {
  @override
  List<Object> get props => [];
}
