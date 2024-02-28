import 'package:dio/dio.dart';
import 'package:mobile_user_app/core/constants/constants.dart';
import 'package:mobile_user_app/features/users/data/models/user.dart';
import 'package:retrofit/retrofit.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  @GET('/users')
  Future<HttpResponse<List<UserModel>>> getUserList({
    @Query('page') int? page,
  });
}
