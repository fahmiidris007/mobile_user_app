import 'package:equatable/equatable.dart';
import 'package:mobile_user_app/data/models/add_user.dart';

abstract class UpdateUserState extends Equatable {
  const UpdateUserState();
}

class UpdateUserInitial extends UpdateUserState {
  @override
  List<Object> get props => [];
}

class UpdateUserLoading extends UpdateUserState{
  @override
  List<Object> get props => [];
}

class UpdateUserLoaded extends UpdateUserState{
  const UpdateUserLoaded({this.newUser = const AddUser()});

  final AddUser newUser;
  @override
  List<Object> get props => [newUser];
}
