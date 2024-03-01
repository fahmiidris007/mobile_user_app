import 'package:equatable/equatable.dart';
import 'package:mobile_user_app/data/models/fav_user.dart';

abstract class SelectedUserEvent extends Equatable {
  const SelectedUserEvent();
}

class GetSelected extends SelectedUserEvent {
  @override
  List<Object?> get props => [];
}

class AddSelected extends SelectedUserEvent {
  FavUser user;

  AddSelected({required this.user});

  @override
  List<Object?> get props => [user];
}

class RemoveSelected extends SelectedUserEvent {
  final int id;

  RemoveSelected({required this.id});

  @override
  List<Object?> get props => [id];
}