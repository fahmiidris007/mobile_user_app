part of 'get_user_bloc.dart';

sealed class GetUserEvent {
  const GetUserEvent();
}

class GetUser extends GetUserEvent {
  const GetUser();
}
