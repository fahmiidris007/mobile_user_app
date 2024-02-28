import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_user_app/core/resources/data_state.dart';
import 'package:mobile_user_app/features/users/domain/entities/user.dart';
import 'package:mobile_user_app/features/users/domain/usecases/get_user.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final GetUserUseCase _getUserUseCase;
  GetUserBloc(this._getUserUseCase) : super(const GetUserLoading()) {
    on<GetUser>(onGetUser);
  }
  void onGetUser(GetUser event, Emitter<GetUserState> emit) async {
    final dataState = await _getUserUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(GetUserSuccess(dataState.data!));
    } else if (dataState is DataFailed) {
      emit(GetUserFailed(dataState.error!));
    }
  }
}
