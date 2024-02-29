import 'package:mobile_user_app/core/resources/data_state.dart';
import 'package:mobile_user_app/core/usecases/usecase.dart';

import 'package:mobile_user_app/features/users/domain/entities/user_list.dart';
import 'package:mobile_user_app/features/users/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<DataState<UserListEntity>, void> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<DataState<UserListEntity>> call({void params}) {
    return _userRepository.getUserList();
  }
}
