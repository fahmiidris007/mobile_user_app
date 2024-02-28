import 'dart:io';

import 'package:dio/dio.dart';
import 'package:mobile_user_app/core/resources/data_state.dart';
import 'package:mobile_user_app/features/users/data/datasource/remote/api_services.dart';
import 'package:mobile_user_app/features/users/data/models/user_list.dart';
import 'package:mobile_user_app/features/users/domain/entities/user.dart';
import 'package:mobile_user_app/features/users/domain/entities/user_list.dart';

import 'package:mobile_user_app/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiServices _apiServices;
  UserRepositoryImpl(this._apiServices);

  @override
  Future<DataState<UserListModel>> getUserList() async {
    try {
      final httpResponse = await _apiServices.getUserList(
        page: 1,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        print(
            'DataSuccess. Response: ${httpResponse.data}, Status: ${httpResponse.response.statusCode}');
        return DataSuccess(httpResponse.data);
      } else {
        print(
            'DataFailed. Response: ${httpResponse.data}, Status: ${httpResponse.response.statusCode}');
        return DataFailed(DioException.connectionError(
          requestOptions: httpResponse.response.requestOptions,
          reason: httpResponse.response.statusMessage!,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
