import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_user_app/data/models/fav_user.dart';

@immutable
sealed class SelectedUserState extends Equatable {
  const SelectedUserState();
}

class SelectedUserInitial extends SelectedUserState {
  @override
  List<Object?> get props => [];
}


class SelectedUserLoaded extends SelectedUserState {
  const SelectedUserLoaded({this.users = const <FavUser>[]});

  final List<FavUser> users;
  @override
  List<Object?> get props => [users];
}

class SelectedUserError extends SelectedUserState {
  @override
  List<Object> get props => [];
}