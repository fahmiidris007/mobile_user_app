import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/data/models/user.dart';
import 'package:mobile_user_app/data/services/user_service.dart';
part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc({required this.userService}) : super(GetUserLoading()) {
    on<GetUser>(_onGetUser);
    on<GetMoreUser>(_onGetMoreUser);
  }
  final UserService userService;
  int _page = 1;
  final int _perPage = 10;

  Future<void> _onGetUser(GetUser event, Emitter<GetUserState> emit) async {
    emit(GetUserLoading());
    try {
      final result = await userService.getUserList();
      emit(GetUserLoaded(user: result));
    } catch (_) {
      emit(GetUserError());
    }
  }

  Future<void> _onGetMoreUser(GetMoreUser event, Emitter<GetUserState> emit) async {
    if (state is GetUserLoaded) {
      _page++;
      try {
        final result = await userService.getUserList(page: _page, perPage: _perPage);
        final List<User> currentUsers = List.from((state as GetUserLoaded).user);
        currentUsers.addAll(result);
        emit(GetUserLoaded(user: currentUsers));
      } catch (_) {
        emit(GetUserError());
      }
    }
  }
}

