import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/data/models/fav_user.dart';
import 'package:mobile_user_app/data/repositories/database_repo.dart';
import 'package:mobile_user_app/features/crud/fav_user/bloc/selected_user_event.dart';
import 'package:mobile_user_app/features/crud/fav_user/bloc/selected_user_state.dart';

class SelectedUserBloc extends Bloc<SelectedUserEvent, SelectedUserState> {
  final DatabaseHelper databaseRepo;

  SelectedUserBloc({required this.databaseRepo}) : super(SelectedUserInitial()) {
    on<GetSelected>(_onGetSelectedUser);
    on<AddSelected>(_onAddSelectedUser);
    on<RemoveSelected>(_onRemoveSelectedUser);
  }

  Future<void> _onGetSelectedUser(GetSelected event, Emitter<SelectedUserState> emit) async {
    emit(SelectedUserInitial());
    try {
      final result = await databaseRepo.getFav();
      emit(SelectedUserLoaded(users: result));
    } catch (_) {
      emit(SelectedUserError());
    }
  }

  Future<void> _onAddSelectedUser(AddSelected event, Emitter<SelectedUserState> emit) async {
    try {
      await databaseRepo.insertUser(event.user);
      add(GetSelected());
    } catch (_) {
      emit(SelectedUserError());
    }
  }

  Future<void> _onRemoveSelectedUser(RemoveSelected event, Emitter<SelectedUserState> emit) async {
    try {
      await databaseRepo.deleteFav(event.id);
      add(GetSelected());
    } catch (_) {
      emit(SelectedUserError());
    }
  }
}
