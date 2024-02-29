import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/data/services/user_service.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_event.dart';
import 'package:mobile_user_app/features/crud/delete_user/bloc/delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final UserService userService;
  DeleteUserBloc({required this.userService}) : super(DeleteUserInitial()) {

    on<DeleteUser>((event, emit) async{
      emit (DeleteUserLoading());
      try{
        await userService.deleteUser(event.id);
        emit (DeleteUserLoaded());
      }catch(_){
        rethrow;
      }
    });
  }
}