import 'package:mobile_user_app/core/resources/data_state.dart';
import 'package:mobile_user_app/core/usecases/usecase.dart';
import 'package:mobile_user_app/features/users/domain/entities/user.dart';
import 'package:mobile_user_app/features/users/domain/repositories/user_repository.dart';

class GetUserUseCase implements UseCase<DataState<List<UserEntity>>, void> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({void params}) {
    return _userRepository.getUserList();
  }
}
