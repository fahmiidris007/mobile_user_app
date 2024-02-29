import 'package:dio/dio.dart';
import 'package:mobile_user_app/core/constants/paths.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  factory DioClient() {
    return instance;
  }

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Paths.baseUrl,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json
    ),
  );

  // GET
  Future<Map<String, dynamic>> get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress
      }) async{
    try{
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if(response.statusCode == 200){
        print("API success. Response: ${response.data}");
        return response.data;
      }
      throw "something went wrong";
    } catch(e){
      print("API error. Error: $e");
      rethrow;
    }
  }
}

