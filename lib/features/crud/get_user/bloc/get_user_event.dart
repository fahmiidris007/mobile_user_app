part of 'get_user_bloc.dart';

abstract class GetUserEvent extends Equatable {
  const GetUserEvent();
}

class GetUser extends GetUserEvent{
  @override
  List<Object?> get props => [];
}

class GetMoreUser extends GetUserEvent{
  final int page;
  final int perPage;

  GetMoreUser({this.page = 1, this.perPage = 10});

  @override
  List<Object?> get props => [page, perPage];
}