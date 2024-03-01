import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_user_app/data/services/user_service.dart';
import 'package:mobile_user_app/features/crud/add_user/bloc/add_user_event.dart';
import 'package:mobile_user_app/features/crud/add_user/bloc/add_user_state.dart';

class AddNewUserBloc extends Bloc<AddNewUserEvent, AddNewUserState> {
  final UserService userService;
  AddNewUserBloc({required this.userService}) : super(AddNewUserInitial()) {

    on<AddNewUser>((event, emit,) async{
      emit(AddNewUserLoading());
      try {
        final result = await userService.postUser(event.name, event.job);
        emit(AddNewUserLoaded(newUser: result));
      } catch (_) {
        rethrow;
      }

    });
  }

}