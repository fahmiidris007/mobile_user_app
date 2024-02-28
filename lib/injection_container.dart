import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_user_app/features/users/data/datasource/remote/api_services.dart';
import 'package:mobile_user_app/features/users/data/repositories/user_repository_impl.dart';
import 'package:mobile_user_app/features/users/domain/repositories/user_repository.dart';
import 'package:mobile_user_app/features/users/domain/usecases/get_user.dart';
import 'package:mobile_user_app/features/users/presentation/bloc/users/remote/get/get_user_bloc.dart';

final s1 = GetIt.instance;
Future<void> initializeDependencies() async {
  s1.registerSingleton<Dio>(Dio());
  s1.registerSingleton<ApiServices>(ApiServices(s1()));
  s1.registerSingleton<UserRepository>(
    UserRepositoryImpl(s1()),
  );
  s1.registerSingleton<GetUserUseCase>(
    GetUserUseCase(s1()),
  );
  s1.registerFactory<GetUserBloc>(() => GetUserBloc(s1()));
}
