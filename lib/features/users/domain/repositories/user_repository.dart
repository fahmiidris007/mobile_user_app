import 'package:mobile_user_app/core/resources/data_state.dart';
import 'package:mobile_user_app/features/users/domain/entities/user.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getUserList();
}
