import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mobile_user_app/features/users/data/models/user.dart';
import 'package:mobile_user_app/features/users/data/services/user_service.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc({required this.crudService}) : super(GetUserLoading()) {
    on<GetUser>(_onGetUser);
  }
  final CrudService crudService;

  Future<void> _onGetUser(GetUser event, Emitter<GetUserState> emit) async {
    emit(GetUserLoading());
    try {
      final result = await crudService.getUserList();
      emit(GetUserLoaded(user: result));
    } catch (_) {
      emit(GetUserError());
    }
  }
}

