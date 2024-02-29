import 'package:dio/dio.dart';
import 'package:mobile_user_app/common/constants/paths.dart';
import 'package:mobile_user_app/data/datasource/remote/api_client.dart';
import 'package:mobile_user_app/data/datasource/remote/api_exceptions.dart';
import 'package:mobile_user_app/data/models/add_user.dart';
import 'package:mobile_user_app/data/models/user.dart';

class UserService{
  Future<List<User>> getUserList({int page = 1, int perPage = 10}) async{
    try {
      final response = await ApiClient.instance.get(Paths.users,  queryParameters: {'page': page, 'per_page': perPage});
      final userList = (response["data"] as List).map((e) => User.fromJson(e)).toList();
      return userList;
    }on DioException catch(e){
      var error = ApiErrors(e);
      throw error.errorMessage;
    }
  }

  Future<AddUser> postUser(String name, String job)async{
    try{
      final response = await ApiClient.instance.post(Paths.users, data: {'name': name, 'job': job});
      return AddUser.fromJson(response);
    }on DioException catch(e){
      var error = ApiErrors(e);
      throw error.errorMessage;
    }
  }

  Future<AddUser> updateUser(String id, String name, String job)async {
    try{
      final response = await ApiClient.instance.put(
        '${Paths.users}/$id',
        data: {
          'id': id,
          'name': name,
          'job': job,
        },
      );
      return AddUser.fromJson(response);
    }on DioException catch(e){
      var error = ApiErrors(e);
      throw error.errorMessage;
    }
  }

  Future<void> deleteUser(String id) async{
    try{
      await ApiClient.instance.delete('${Paths.users}/$id');
    }on DioException catch(e){
      var error = ApiErrors(e);
      throw error.errorMessage;
    }
  }
}
