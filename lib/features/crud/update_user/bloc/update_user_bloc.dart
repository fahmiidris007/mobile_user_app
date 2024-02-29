import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/data/services/user_service.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_event.dart';
import 'package:mobile_user_app/features/crud/update_user/bloc/update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final UserService userService;
  UpdateUserBloc({required this.userService}) : super(UpdateUserInitial()) {

    on<UpdateUser>((event, emit) async{
      emit (UpdateUserLoading());
      try{
        final result = await userService.updateUser(event.id, event.name, event.job);
        emit(UpdateUserLoaded(newUser: result));
      }catch (_){
        rethrow;
      }

    });
  }
}