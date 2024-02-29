import 'package:dio/dio.dart';
import 'package:mobile_user_app/core/constants/paths.dart';
import 'package:mobile_user_app/features/users/data/datasource/remote/dio_client.dart';
import 'package:mobile_user_app/features/users/data/datasource/remote/dio_exceptions.dart';
import 'package:mobile_user_app/features/users/data/models/user.dart';

class CrudService{
  Future<List<User>> getUserList() async{
    try {
      final response = await DioClient.instance.get(Paths.users);
      final userList = (response["data"] as List).map((e) => User.fromJson(e)).toList();
      return userList;
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }
}
