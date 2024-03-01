
import 'package:equatable/equatable.dart';
import 'package:mobile_user_app/data/models/add_user.dart';

abstract class AddNewUserState extends Equatable {
  const AddNewUserState();
}

class AddNewUserInitial extends AddNewUserState {
  @override
  List<Object> get props => [];
}

class AddNewUserLoading extends AddNewUserState {
  @override
  List<Object> get props => [];
}

class AddNewUserLoaded extends AddNewUserState {
  const AddNewUserLoaded({this.newUser = const AddUser()});

  final AddUser newUser;
  @override
  List<Object> get props => [newUser];
}