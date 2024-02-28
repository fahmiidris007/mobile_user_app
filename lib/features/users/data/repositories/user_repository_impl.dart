import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_user_app/core/resources/data_state.dart';
import 'package:mobile_user_app/features/users/data/datasource/remote/api_services.dart';
import 'package:mobile_user_app/features/users/data/models/user.dart';
import 'package:mobile_user_app/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiServices _apiServices;
  UserRepositoryImpl(this._apiServices);
  @override
  Future<DataState<List<UserModel>>> getUserList() async {
    final httpResponse = await _apiServices.getUserList(
      page: 1,
    );

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(DioException.connectionError(
        requestOptions: httpResponse.response.requestOptions,
        reason: httpResponse.response.statusMessage!,
      ));
    }
  }
}
